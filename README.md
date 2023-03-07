# The Zig implementation of the libp2p networking stack

## Design principles

`zig zen`


## Examples

### Interop tests

Run a local test with Zig-libp2p dialing Zig-libp2p

```
zig build run-interop-test -Dtest-filter="ping interop" 
```

## Dependencies

MsQuic dependency relies on [Nix](https://nixos.org/). You can link it without
Nix, but you'll have to do that yourself.