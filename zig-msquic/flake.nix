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

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, zig-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
        pkgs-unstable = import nixpkgs-unstable { system = system; };
        openssl = pkgs-unstable.quictls;
        zig = zig-overlay.packages.${system}."0.10.0";
      in
      {
        packages.libmsquic = pkgs.callPackage (import ./msquic.nix) { quictls = openssl; };
        devShell = pkgs.mkShell rec {
          buildInputs = [ zig openssl ]
            ++ (if pkgs.stdenv.isDarwin
          then
            (with pkgs.darwin.apple_sdk.frameworks;
            [ Security Foundation ])
          else [ ]);

          LIB_MSQUIC = "${self.packages.${system}.libmsquic}";
          LIB_OPENSSL = "${openssl.dev}";
        };

        packages.glibc-fhs = (pkgs.buildFHSUserEnv {
          name = "glibc-env";
          targetPkgs = pkgs: (with pkgs;
            [ glibc ]);
          multiPkgs = pkgs: (with pkgs;
            [ glibc ]);
          runScript = "/usr/bin/bash";
        });

        devShells.CI = self.devShell.${system} // self.packages.${system}.glibc-fhs.env;
      });
}
