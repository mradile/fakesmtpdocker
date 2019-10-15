# Docker image for fake smtp

This docker image wraps the [smtp server fakesmtp](http://nilhcem.com/FakeSMTP/index.html).

To use server start it like this:

```bash
docker run --rm -ti -p 2525:2525 -v /tmp/emails:/emails mradile/fakesmtp:latest
```
