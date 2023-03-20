{
  description = "zig-msquic";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
  inputs.nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.zig-overlay = {
    url = "github:mitchellh/zig-overlay";
    inputs = {
      nixpkgs.follows = "nixpkgs-unstable";
      flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, zig-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
        pkgs-unstable = import nixpkgs-unstable { system = system; };
        openssl = pkgs-unstable.quictls;
        # openssl = pkgs-unstable.openssl;
        # openssl = pkgs-unstable.openssl.override
        #   {
        #     static = true;
        #   };
        zig = zig-overlay.packages.${system}."0.10.1";
      in
      {
        packages.libmsquic = pkgs.callPackage (import ./msquic.nix { debug = false; }) { quictls = openssl; };
        packages.libmsquic-debug = pkgs.callPackage (import ./msquic.nix { debug = true; }) { quictls = openssl; };
        packages.openssl = openssl;
        devShell = pkgs.mkShell rec {
          buildInputs = [ zig openssl ]
            ++ (if pkgs.stdenv.isDarwin
          then
            (with pkgs.darwin.apple_sdk.frameworks;
            [ Security Foundation ])
          else [ ]);

          LIB_MSQUIC = "${self.packages.${system}.libmsquic}";
          LIB_MSQUIC_DEBUG = "${self.packages.${system}.libmsquic-debug}";
          LIB_OPENSSL = "${openssl.dev}";
          LIB_OPENSSL_DEBUG = "${openssl.dev}";
        };

        packages.tests = pkgs.stdenv.mkDerivation
          {
            name = "tests";
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

            LIB_MSQUIC = "${self.packages.${system}.libmsquic}";
            LIB_OPENSSL = "${openssl.dev}";

            buildPhase = ''
              export HOME=$PWD
              ${zig}/bin/zig build tests
            '';
            installPhase = ''
              cp -r zig-out $out
            '';
          };
      });
}
