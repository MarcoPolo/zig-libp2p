{
  description = "zig-libp2p";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
  inputs.nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.zig-overlay = {
    url = "github:mitchellh/zig-overlay";
    inputs = {
      nixpkgs.follows = "nixpkgs-unstable";
      flake-utils.follows = "flake-utils";
    };
  };
  inputs.zls = {
    url = "github:zigtools/zls/master";
    inputs = {
      nixpkgs.follows = "nixpkgs-unstable";
      zig-overlay.follows = "zig-overlay";
      flake-utils.follows = "flake-utils";
    };
  };


  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, zig-overlay, zls }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
        pkgs-unstable = import nixpkgs-unstable { system = system; };
        zig = zig-overlay.packages.${system}."0.10.1";
        # zig = zig-overlay.packages.${system}."master";
        zig-deps = (import ./zig-deps.nix) { inherit pkgs; };
        zig-msquic-flake = ((import ./zig-msquic/flake.nix).outputs inputs);
        openssl = zig-msquic-flake.packages.${system}.openssl;
      in
      {
        packages.libmsquic = zig-msquic-flake.packages.${system}.libmsquic;
        packages.libmsquic-debug = zig-msquic-flake.packages.${system}.libmsquic-debug;
        packages.zls = zls.packages.${system}.default;
        # packages.zls = pkgs.stdenvNoCC.mkDerivation {
        #   name = "zls";
        #   version = "master";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "zigtools";
        #     repo = "zls";
        #     rev = "0.9.0";
        #     fetchSubmodules = true;
        #     sha256 = "sha256-MVo21qNCZop/HXBqrPcosGbRY+W69KNCc1DfnH47GsI=";
        #     # sha256 = pkgs.lib.fakeSha256;
        #   };
        #   nativeBuildInputs = [
        #     deps.zig
        #     pkgs.autoPatchelfHook # Automatically setup the loader, and do the magic
        #   ];
        #   dontConfigure = true;
        #   dontInstall = true;
        #   buildPhase = ''
        #     mkdir -p $out
        #     zig build install -Drelease-safe=true -Ddata_version=master --prefix $out
        #   '';
        #   XDG_CACHE_HOME = ".cache";
        # };
        packages.interop = pkgs.stdenv.mkDerivation
          {
            name = "interop-binary";
            src = ./.;
            nativeBuildInputs = [
              pkgs.autoPatchelfHook # Automatically setup the loader, and do the magic
            ];
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
              ${zig}/bin/zig build interop
            '';
            installPhase = ''
              cp -r zig-out $out
            '';
          };

        packages.zig-libp2p-fhs = (pkgs.buildFHSUserEnv {
          name = "code-server-env";
          targetPkgs = pkgs: (with pkgs;
            [ glibc ]);
          multiPkgs = pkgs: (with pkgs;
            [ glibc ]);
          runScript = "/usr/bin/bash";
        });

        devShells.nonNixLinux = self.devShell.${system} // self.packages.${system}.zig-libp2p-fhs.env;

        devShell =
          pkgs.mkShell
            rec {
              buildInputs = [
                zig
                self.packages.${system}.zls
                openssl
                # pkgs.pkg-config
                glibc
              ]
              ++ (if pkgs.stdenv.isDarwin
              then
                (with pkgs.darwin.apple_sdk.frameworks;
                [ Security Foundation ])
              else [ ]);
              # PKG_CONFIG_PATH = "${pkgs.openssl_3_0.dev}/lib/pkgconfig";
              # FRAMEWORKS = "${pkgs.darwin.apple_sdk.frameworks.Security}/Library/Frameworks:${pkgs.darwin.apple_sdk.frameworks.Foundation}/Library/Frameworks";
              LIBSYSTEM_INCLUDE = (if pkgs.stdenv.isDarwin then
                "${pkgs.darwin.Libsystem.outPath}/include" else "");
              PB_INCLUDE = "${pkgs.protobufc}/include";
              LIB_MSQUIC = "${self.packages.${system}.libmsquic}";
              LIB_MSQUIC_DEBUG = "${self.packages.${system}.libmsquic-debug}";
              LIB_OPENSSL = "${openssl.dev}";
              ZIG_DEPS = "${zig-deps.depsJson}";
            };

      });
}
