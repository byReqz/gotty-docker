# gotty-docker

this is a dynamically built gotty container

## features:
- select packages with environment values
- easily run in docker composes
- available as alpine and debian base images

## branches
### alpine
- available with :latest
- base alpine image + curl, jq, tmux and libc6-compat (light glibc compatibility to get gotty running)
- main and community repo available

### debian
- available with :debian
- base image + curl, jq and tmux
- sid main repo available

## environment values
port - sets the port the gotty web-ui runs at (def. 8080)
userpass - sets a username and password for the webui (optional, def. none)
title - set application title (browser and tmux session title, def. gotty)
pkgs - additional packages to install when the container is started (optional, def. none)
command - the command to run (required, def. none/pfetch)

## compose
this example can also be found in the repo

```yaml
version: '2.3'

services:
  gotty-docker:
    container_name: gotty-docker
    image: byreqz/gotty-docker:latest
    restart: unless-stopped
    ports:
     - 1234:1234
    environment:
     - port=1234
     - userpass=user:pass
     - title=1234
     - pkgs=htop
     - command=htop
```


