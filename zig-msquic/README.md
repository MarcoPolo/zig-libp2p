# Zig MsQuic

A small Zig library that wraps [MsQuic].

This library is really only needed because Zig's translate C can't yet handle
bitfields well: https://github.com/ziglang/zig/issues/1499. 

I may also be setting the bitfields incorrectly here. Especially on Architectures I haven't tested. So be warned.

# Usage

See the throughput client for an example. And refer to the [MsQuic] docs on how to use MsQuic generally.

Building and linking is a bit tricky, since you need to link MsQuic and the
[quictls fork of openssl](https://github.com/quictls/openssl). For ease and
reproducibilty the library itself uses [Nix] to manage these dependencies, and
links them in `build.zig`. If you're using this library you'll need to do
something similar. If unfamiliar with [Nix], here's a very quick primer: [Declarative Dev Environments](https://marcopolo.io/code/declarative-dev-environments/).

(todo add example projects that use this as a library).


[MsQuic]: https://github.com/microsoft/msquic
[Nix]: https://nixos.org