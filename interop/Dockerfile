FROM nixos/nix AS builder

# Run from root dir

# Enable nix-command and flakes
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

# Install cachix
RUN nix-env -iA cachix -f https://cachix.org/api/v1/install

# Auth
ARG CACHIX_AUTH_TOKEN
ENV CACHIX_AUTH_TOKEN=$CACHIX_AUTH_TOKEN

# Use cachix
RUN cachix use zig-libp2p

WORKDIR /app
COPY flake* ./
RUN mkdir -p zig-msquic
COPY zig-msquic ./zig-msquic
COPY zig-deps.nix ./


# Push to cachix if we have an auth token
RUN if [ -n "$CACHIX_AUTH_TOKEN" ] ; then nix develop --profile dev-profile ; fi
RUN if [ -n "$CACHIX_AUTH_TOKEN" ] ; then cachix authtoken $CACHIX_AUTH_TOKEN ; fi
RUN if [ -n "$CACHIX_AUTH_TOKEN" ] ; then cachix push zig-libp2p dev-profile ; fi

COPY . .
RUN nix build '.#interop'

# Copy all the run time dependencies into /tmp/nix-store-closure
RUN mkdir /tmp/nix-store-closure
RUN echo "Output references (Runtime dependencies):" $(nix-store -qR result/)
RUN cp -R $(nix-store -qR result/) /tmp/nix-store-closure

# Our production stage
FROM scratch
WORKDIR /app
# Copy the runtime dependencies into /nix/store
# Note we don't actually have nix installed on this container. But that's fine,
# we don't need it, the built code only relies on the given files existing, not
# Nix.
COPY --from=builder /tmp/nix-store-closure /nix/store
COPY --from=builder /app/result /app
CMD ["/app/bin/interop"]
