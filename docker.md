# Docker

Lightweight virtualization<br>
daemon + containers are OS processes =><br>
containers share kernel/network/disk/memory with the host

Containers abstract applications from operating systems, much like
virtualization abstracts operating systems from physical hardware

The kernel isolates network and disk resources per processes running in a kernel namespace: the container.<br>
Kernel namespaces are possible thanks to `runc` (run containers) and previously Linux Containers (LXC)?<br>
`aufs` is used for disk sharing. All containers get a ro shared acces to all common parts of the OS + get their own mount for writing.

Each docker image contains only the differences from the base. When you run
your image, you also need the base, and it layers your image on top of the base
using a layered file system (`aufs`)

docker daemon
: not a hypervisor, it's the containerization runtime

image
: provides filesystem, dependencies, config

container
: runnable instance of an image aka sandboxed process (akin to `chroot`)

```bash
docker help ps
docker search
docker ps
docker build # Dockerfile
docker volume ls # persist data
docker images # docker image ls
docker image prune # manage
docker container prune
docker rm id

docker run -it --rm centos:7 bash # interactive + tty + auto rm container on exit
docker run -d -p 80:80 docker/getting-started # detached mode
docker exec -it id cat /etc/passwd # exec a command in a running container
docker stop id

docker pull debian:stable-slim
docker push kurkale6ka/catnip
```

containers need to be on the same network in order to talk

```bash
docker network ls
docker network create my-app # docker run --network my-app ...
```

# Docker Compose

* define your application stack in a versioned file
* docker-compose up/down/... `-d`
* application can be multi-container: e.g app & mysql in the below example

```yaml
version: "3.7"

services:
  app:
    image: node:12-alpine
    ports:
      - 3000:3000
    environment:
      MYSQL_HOST: mysql

  mysql:
    image: mysql:5.7
    volumes:
      - mysql-data:/var/lib/mysql

volumes:
  mysql-data:
```

versus 2 docker run commands:

```bash
docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network my-app \
  -e MYSQL_HOST=mysql \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"

docker run -d \
  --network my-app --network-alias mysql \
  mysql:5.7
```
