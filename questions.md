# Answers for other questions

- one message - minimum 739 bytes (depends of bike_id length) so aproximately we can set it to 800 bytes

-
```
we have got 8388608 per 31 days
per 1 day we have 270600 bytes if we assume that we sent
equal data size per day
so the ammount of messages we can send per day is
270600 / 800 = 338 messages```

-  I think one option is to use 2 virtual machines one for server one for client, and chcecking the communication sending messages from client to server. Write some scenarios and test them manualy, or write some scripts for bash.
