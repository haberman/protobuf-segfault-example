Steps to reproduce
---
```
git clone git@github.com:sas5437/protobuf-segfault-example.git
cd protobuf-segfault-example
docker build -t 3925:v1 .
docker run 3925:v1
```
Error message
---
```
$ docker run 3925:v1
/usr/local/bundle/gems/google-protobuf-3.5.0-x86_64-linux/lib/google/protobuf/any_pb.rb:15: [BUG] Segmentation fault at 0x00000000000170f6
ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-linux-musl]

...

[NOTE]
You may have encountered a bug in the Ruby interpreter or extension libraries.
Bug reports are welcome.
For details: http://www.ruby-lang.org/bugreport.html
```
Debugging steps
---
```
$ docker run -it 3925:v1 /bin/sh
/app # ulimit -c unlimited
/app # ruby trace.rb
/app # gdb $(which ruby) core
(gdb) bt
```
