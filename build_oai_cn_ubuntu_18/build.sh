#!/bin/sh
#docker container rm oaicn -f
#docker rmi oai-cn
# mv ~/go/src/snap-hook-for-docker/cmd/hook/hook ./
docker build -t oai-ran --force-rm=true --rm=true .

# start the detached container
docker run \
    --name=oai-ran \
    -ti \
    --tmpfs /run \
    --tmpfs /run/lock \
    --tmpfs /tmp \
    --cap-add SYS_ADMIN \
    --device=/dev/fuse \
    --security-opt apparmor:unconfined \
    --security-opt seccomp:unconfined \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /lib/modules:/lib/modules:ro \
    -h ubuntu \
    -d oai-ran 
