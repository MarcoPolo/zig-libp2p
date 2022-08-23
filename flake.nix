{
  description = "zig-libp2p";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
  inputs.nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.zig-overlay.url = "github:mitchellh/zig-overlay";


  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, zig-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
        pkgs-unstable = import nixpkgs-unstable { system = system; };
        deps = (import ./dependencies.nix { inherit system; });
        openssl = pkgs-unstable.quictls;
        zig = zig-overlay.packages.${system}."master-2022-07-23";
        zig-deps = (import ./zig-deps.nix) { inherit pkgs; };
      in
      {
        packages.libmsquic = pkgs.callPackage (import ./msquic.nix) { quictls = openssl; };
        packages.zls = pkgs.stdenvNoCC.mkDerivation {
          name = "zls";
          version = "master";
          src = pkgs.fetchFromGitHub {
            owner = "zigtools";
            repo = "zls";
            rev = "0.9.0";
            fetchSubmodules = true;
            sha256 = "sha256-MVo21qNCZop/HXBqrPcosGbRY+W69KNCc1DfnH47GsI=";
            # sha256 = pkgs.lib.fakeSha256;
          };
          nativeBuildInputs = [ deps.zig ];
          dontConfigure = true;
          dontInstall = true;
          buildPhase = ''
            mkdir -p $out
            zig build install -Drelease-safe=true -Ddata_version=master --prefix $out
          '';
          XDG_CACHE_HOME = ".cache";
        };

        devShell =
          pkgs.mkShell
            rec {
              buildInputs = [
                zig
                self.packages.${system}.zls
                openssl
                pkgs.pkg-config
                pkgs.protobufc
                pkgs.protobuf
                pkgs.go_1_17
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
              LIB_OPENSSL = "${openssl.dev}";
              ZIG_DEPS = "${zig-deps.depsJson}";
            };

      });
}
