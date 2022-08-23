# The Zig implementation of the libp2p networking stack

## Design principles

1. All swarm code happens on a single thread.
1. Protocols know how to handle their data. Don't assume what the protocol
   should want to do.
1. Batch when possible.
1. Avoid thread contention.
1. Minimize library code.
1. Handlers may run on their own thread.
1. Minimize buffering. If we can push data to a handler prefer that to buffering
   the data for the handler in the future.

## What does the swarm _Actually_ do?

1. Manages data allocated for:
  1. Connections. The connection manager in turn manages data allocated for
     substreams. It's okay for connection creation/destruction to be single
     threaded. It's not a common event.
  1. Peer information. Tracks the known addresses (and their TTL) for a peer.
    1. Also tracks known protocols for a peer.
1. Manages listening addresses.
1. Manages propogating events for:
  1. New connection
  1. Closed connection
  1. Protocol events
  1. This means that any handle_x method in protocols are _started_ (but may not
    finish) in the swarm thread.

## Swarm/Protocol interface

Here are all the methods the swarm will call for a protocol if they're defined.
```
handleNewConnection(conn_id, peer_id) void // may be async
handleClosedConnection(conn_id, peer_id) void // may be async
handleProtocolEvent(eventtype: type, event: eventtype) void // may be async
// A peer started a stream with us
acceptInboundStream(stream_id: StreamHandle) void // may be async
```

likewise the protocol may call the following methods on the swarm:

```
listen(listen_addr) ConnHandle
dial(peer_addr, force_new_conn) ConnHandle
dialWithID(peer_id, force_new_conn) ConnHandle
metadataForPeer(peer_id) PeerMetaHandle
```

## Patcket handler? 

todo: Figure out how to authenticate packet handler interface (what does
wireguard do?)
todo: spec this?

We can extend the above with packet handling ability by adding:
```
// Handles a received packet. May hold on to the packet handler to send and
// receive more packets. While packet handler is open (not closed) this method
// won't be called again.
handlePacket(packet_handler_id: PacketHandlerHandle) void // may be async
```

and the swarm would then support:
```
// Note while a packet handler is not closed the protocol won't receive these packets for this packet switch interface.
packetHandlerFor(peer_addr, force_new) PacketHandlerHandle
packetHandlerForID(peer_id, force_new) PacketHandlerHandle
```

## Open questions:

1. How to know if you should keep a connection alive?
  - After all substreams are closed?
1. Is "swarm" the preferred term? Should this be called switch instead?