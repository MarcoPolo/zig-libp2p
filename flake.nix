{
  description = "zig libp2p";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
  inputs.nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
        pkgs-unstable = import nixpkgs-unstable { system = system; };
        deps = (import ./dependencies.nix { inherit system; });
      in
      {
        packages.libmsquic = pkgs.callPackage (import ./msquic.nix) { };
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
                deps.zig
                self.packages.${system}.zls
                pkgs.openssl
                # pkgs.pkg-config
              ] ++ (with pkgs.darwin.apple_sdk.frameworks; [
                Security
                Foundation
              ]);
              # PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
              # FRAMEWORKS = "${pkgs.darwin.apple_sdk.frameworks.Security}/Library/Frameworks:${pkgs.darwin.apple_sdk.frameworks.Foundation}/Library/Frameworks";
              LIBSYSTEM_INCLUDE = "${pkgs.darwin.Libsystem.outPath}/include";
              LIB_MSQUIC = "${self.packages.${system}.libmsquic}";
              LIB_OPENSSL = "${pkgs.openssl.dev}";
            };

      });
}
