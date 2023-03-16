# build
podman build -t python36-env-sync .

# shell
podman run --rm -it python36-env-sync /bin/bash

# run
podman run \
--name python36-env-sync \
--volume /export/python/python36:/export \
--volume ./root/projects:/projects \
--rm \
localhost/python36-env-sync

# run - cache
podman run \
--name python36-env-sync \
--volume /export/python/python36:/export \
--volume ./root/projects:/projects \
--volume ./root/.pip/pip.conf:/root/.pip/pip.conf \
--rm \
localhost/python36-env-sync
