# build
podman build -t generic-blob-sync .

# shell
podman run --rm -it generic-blob-sync /bin/bash

# run
podman run \
--name generic-blob-sync \
--volume /export/blob:/export \
--volume ./root/projects:/projects \
--rm \
localhost/generic-blob-sync
