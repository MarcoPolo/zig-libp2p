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
        packages.hello = pkgs.hello;
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
        defaultPackage = self.packages.${system}.hello;
        devShell =
          pkgs.mkShell rec {
            buildInputs = [
              deps.zig
              self.packages.${system}.zls
              # pkgs.clangStdenv
              # pkgs.cmake
            ] ++ (with pkgs.darwin.apple_sdk.frameworks; [
              # Security
              # Kernel
            ]);
          };
      });
}
