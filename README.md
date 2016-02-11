# Docker container for pickups

[Pickups](https://github.com/mtomwing/pickups) is an IRC gateway for
Google Hangouts using [hangups](https://github.com/tdryer/hangups).

Useful for groupchats, which gtalk's XMPP doesn't support. 

## How to get it

```
docker pull vando/pickups
docker run -v ${HOME}/.config/hangups:/home/pickups/.config/hangups \
           -v ${HOME}/.cache/hangups:/home/pickups/.cache/hangups \
           -p 6667:6667 \
	   -d --restart=always --name pickups vando/pickups
```

## Image size

Previous docker image was based on Debian 8.2 (327.1 MB) and the new release
is based on [Alpine 3.3 with Python3.5](https://github.com/frol/docker-alpine-python3)
(73.7 MB).
