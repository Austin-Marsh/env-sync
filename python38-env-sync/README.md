# build
podman build -t python38-env-sync .

# shell
podman run --rm -it python38-env-sync /bin/bash

# run
podman run \
--name python38-env-sync \
--volume /export/python/python38:/export \
--volume ./root/projects:/projects \
--rm \
localhost/python38-env-sync

# run - cache
podman run \
--name python38-env-sync \
--volume /export/python/python38:/export \
--volume ./root/projects:/projects \
--volume ./root/.pip/pip.conf:/root/.pip/pip.conf \
--rm \
localhost/python38-env-sync
