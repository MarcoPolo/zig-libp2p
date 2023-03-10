# The Zig implementation of the libp2p networking stack

[libp2p] is a collection of protocols, implementations, and transports to
facilitate peer-to-peer applications.

[Zig] is a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software.

Zig + libp2p = ⚡ 🌐 🚀

## Design principles

`zig zen`

## Building with Zig-libp2p

This library is a thin wrapper around [MsQuic] using
[zig-msquic](https://github.com/marcopolo/zig-msquic). It exposes the minimal
set of tools to allow you to interact with other QUIC libp2p nodes. These
include:

1. Multistream select (src/protocols/multistream_select.zig)
2. PeerIDs (src/crypto/openssl.zig)
3. The libp2p TLS certificate extension (src/crypto/openssl.zig)

When you build on Zig-libp2p you are really building on [MsQuic] and using some
libp2p specific tools from this library. See `interop/main.zig` for an example.

Refer to the [MsQuic] docs for information on how to use [MsQuic].

## Development and Usage

1. Install [Nix](https://nixos.org).
2. Enter a dev shell with `nix develop` or use [direnv](https://direnv.net)

## Examples

### Interop tests

Located in `interop/main.zig`.

Run a local test with Zig-libp2p dialing Zig-libp2p

```
zig build interop-test && ./zig-out/bin/interop-test
```

## Dependencies

[MsQuic] dependency relies on [Nix](https://nixos.org/). You can link it without
Nix, but you'll have to do that yourself.

[libp2p]: https://libp2p.io
[MsQuic]: https://github.com/microsoft/msquic
[Zig]: https://ziglang.org