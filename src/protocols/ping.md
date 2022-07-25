# Ping

1. The initiator records the start time.
1. The initiator writes some random bytes to the stream. 
1. The responder should respond with the same bytes (echo back the input).
1. The initiator then reads the same number of bytes from the stream.
1. If the bytes are the same, the duration is calculated from the start time and
   the duration is recorded.
1. Repeat indefinitely.

number of random bytes from the stream. 