FROM nixos/nix

WORKDIR /app
COPY flake* ./
RUN mkdir -p zig-msquic
COPY zig-msquic ./zig-msquic
COPY zig-deps.nix ./
RUN nix --extra-experimental-features nix-command --extra-experimental-features flakes develop

COPY . .
