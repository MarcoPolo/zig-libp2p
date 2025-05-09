{
  description = "zig-libp2p";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
  inputs.nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.zig-overlay = {
    url = "github:bandithedoge/zig-overlay";
    inputs = {
      nixpkgs.follows = "nixpkgs-unstable";
      flake-utils.follows = "flake-utils";
    };
  };


  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, zig-overlay }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
        zig = zig-overlay.packages.${system}."0_10_1";
        zig-deps = (import ./zig-deps.nix) { inherit pkgs; };
        zig-msquic-flake = ((import ./zig-msquic/flake.nix).outputs inputs);
        openssl = zig-msquic-flake.packages.${system}.openssl;
      in
      {
        packages.libmsquic = zig-msquic-flake.packages.${system}.libmsquic;
        packages.libmsquic-debug = zig-msquic-flake.packages.${system}.libmsquic-debug;
        packages.zig = zig;
        packages.interop = pkgs.stdenv.mkDerivation
          {
            name = "interop";
            src = ./.;
            nativeBuildInputs =
              (if pkgs.stdenv.isDarwin
              then
                (with pkgs.darwin.apple_sdk.frameworks;
                [ ])
              else [
                pkgs.autoPatchelfHook # Automatically setup the loader, and do the magic
              ]);
            buildInputs = [
              zig
              openssl
            ]
            ++ (if pkgs.stdenv.isDarwin
            then
              (with pkgs.darwin.apple_sdk.frameworks;
              [ Security Foundation ])
            else [ ]);
            LIBSYSTEM_INCLUDE = (if pkgs.stdenv.isDarwin then
              "${pkgs.darwin.Libsystem.outPath}/include" else "");
            LIB_MSQUIC = "${self.packages.${system}.libmsquic}";
            LIB_OPENSSL = "${openssl.dev}";
            ZIG_DEPS = "${zig-deps.depsJson}";
            buildPhase = ''
              # build_dir=$(mktemp -d)
              # cp -r . $build_dir
              # cd $build_dir
              export HOME=$PWD
              ${zig}/bin/zig build ${(if (pkgs.stdenv.isLinux && pkgs.stdenv.isx86_64) then  "-Dcpu=x86_64" else "")} interop
            '';
            installPhase = ''
              cp -r zig-out $out
            '';
          };

        packages.interopContainer = pkgs.dockerTools.buildImage {
          name = "interop-runner";
          config = {
            Cmd = [ "${self.packages.${system}.interop}/bin/interop" ];
          };
        };

        packages.zig-libp2p-fhs = (pkgs.buildFHSUserEnv {
          name = "code-server-env";
          targetPkgs = pkgs: (with pkgs;
            [ glibc openssl ]);
          runScript = "/usr/bin/bash";
        });

        devShells.nonNixLinux = self.devShell.${system} // self.packages.${system}.zig-libp2p-fhs.env;

        devShell =
          pkgs.mkShell
            rec {
              buildInputs = [
                zig
                openssl
                # pkgs.pkg-config
              ]
              ++ (if pkgs.stdenv.isDarwin
              then
                (with pkgs.darwin.apple_sdk.frameworks;
                [ Security Foundation ])
              else [ pkgs.glibc ]);
              # PKG_CONFIG_PATH = "${pkgs.openssl_3_0.dev}/lib/pkgconfig";
              # FRAMEWORKS = "${pkgs.darwin.apple_sdk.frameworks.Security}/Library/Frameworks:${pkgs.darwin.apple_sdk.frameworks.Foundation}/Library/Frameworks";
              LIBSYSTEM_INCLUDE = (if pkgs.stdenv.isDarwin then
                "${pkgs.darwin.Libsystem.outPath}/include" else "");
              PB_INCLUDE = "${pkgs.protobufc}/include";
              LIB_MSQUIC = "${self.packages.${system}.libmsquic}";
              LIB_MSQUIC_DEBUG = "${self.packages.${system}.libmsquic-debug}";
              LIB_OPENSSL = "${openssl.dev}";
              ZIG_DEPS = "${zig-deps.depsJson}";
              ELF_INTERPRETER = (if pkgs.stdenv.isLinux then "${pkgs.glibc}/lib/ld-linux-x86-64.so.2" else "");
            };

      });
}
