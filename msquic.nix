{ stdenv, fetchFromGitHub, clangStdenv, cmake, powershell, darwin, perl, xcbuild, quictls, pkgs }:

pkgs.clangStdenv.mkDerivation rec {
  pname = "libmsquic";
  version = "4326e6bac26d880fa833a7edcf39fcc27f1996f9";
  src = fetchFromGitHub {
    fetchSubmodules = true;
    owner = "microsoft";
    repo = "msquic";
    rev = version;
    sha256 = "sha256-6Ga3Iqlhh60unRfzWVmu0iFDUdF4F1aBelHvhZObPP4=";
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
    # HOME=$TMPDIR pwsh ./scripts/build.ps1 -Config Release -Static
    HOME=$TMPDIR pwsh ./scripts/build.ps1 -Config Debug -Static
  '';

  installPhase = ''
    mkdir $out
    cp -r artifacts $out
    mkdir $out/src
    cp -r src/inc $out/src
  '';
}
