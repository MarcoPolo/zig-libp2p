# Perf runner for test-plans

## Building:

From the root dir

```
docker build -t zig-libp2p-perf -f examples/perf/Dockerfile .
```

### Using the server
Pass in the run-server flag

```
 docker run --init --rm -it zig-libp2p-perf --run-server
```

### Using the client
```
 docker run --init --rm -it zig-libp2p-perf \
    --n-times 3 --upload-bytes 1000 --download-bytes 1000 \
   --server-address <multiaddr>
```


