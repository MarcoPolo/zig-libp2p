{ debug }: { stdenv, fetchFromGitHub, clangStdenv, cmake, powershell, darwin, perl, xcbuild, quictls, pkgs }:

pkgs.clangStdenv.mkDerivation rec {
  pname = "libmsquic";
  # version = "12681935c22129d72efafa0cb7ddb375cfde2de8";
  version = "v2.1.8";
  src = fetchFromGitHub {
    fetchSubmodules = true;
    owner = "microsoft";
    repo = "msquic";
    rev = version;
    sha256 = "sha256-Rm1c2hfgzwzd/1K479cBksuoqeOoEvZ2j+zuzFVR9ug=";
    # sha256 = "sha256-9L3kDIA4zXkqCTgDrKi2lvx9PhkwQ++aicXB1b0OIB4=";
    # sha256 = pkgs.lib.fakeSha256;
  };
  buildInputs = [
    pkgs.clangStdenv
    quictls
    pkgs.python3
    cmake
    powershell
    perl
  ]
  ++ (if stdenv.isDarwin
  then
    (with darwin.apple_sdk.frameworks;
    [ Security ] ++ [ xcbuild ])
  else [ ]);

  configurePhase = "echo noop";

  buildPhase = ''
    # Patch #!/bin/sh. This doesn't exist in our Nix builder
    patchShebangs --build submodules/openssl/config
    # Replace /usr/bin/env. These don't exists in our Nix builder
    sed -i "s@usr/bin/env@${pkgs.coreutils}/bin/env@g" submodules/openssl/config
    cat submodules/openssl/config

    # Change to build release or static
    ${if debug then ''
    HOME=$TMPDIR pwsh ./scripts/build.ps1 -Config Debug -Static
    '' else ''
    HOME=$TMPDIR pwsh ./scripts/build.ps1 -Config Release -Static
    ''}
  '';

  installPhase = ''
    mkdir $out
    cp -r artifacts $out
    mkdir $out/src
    cp -r src/inc $out/src
  '';
}
