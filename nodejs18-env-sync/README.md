# build
podman build -t nodejs18-env-sync .

# shell
podman run --rm -it nodejs18-env-sync /bin/bash

# run
podman run \
--name nodejs18-env-sync \
--volume /export/node/nodejs18:/export \
--volume ./root/projects:/projects \
--rm \
localhost/nodejs18-env-sync

# run - cache
podman run \
--name nodejs18-env-sync \
--volume /export/node/nodejs18:/export \
--volume ./root/projects:/projects \
--volume ./root/.npmrc:/root/.npmrc \
--volume ./root/.nrc:/root/.nrc \
--rm \
localhost/nodejs18-env-sync
