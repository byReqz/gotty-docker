# gotty-docker

this is a dynamically built gotty container

#### features:
- select packages with environment values
- easily run in docker composes
- available as alpine and debian base images

### compose
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
