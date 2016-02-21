docker-pastec
=============

Docker container for Pastec

# Usage

```bash
$ docker build -t pastec .
$ docker run -ti -p 4212:4212 pastec
```

Check the pastec health:

```bash
$ curl -X POST -d '{"type":"PING"}' http://`docker-machine ip default`:4212/
```
