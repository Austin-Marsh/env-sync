# build
podman build -t lastversion-env-sync .

# shell
podman run --rm -it lastversion-env-sync /bin/bash

# run
podman run \
--name lastversion-env-sync \
--volume /export/lastversion/:/export \
--volume ./root/projects:/projects \
--rm \
localhost/lastversion-env-sync
