# build
podman build -t ubi8-repo-sync .

# shell
podman run --rm -it ubi8-repo-sync /bin/bash

# run
podman run \
--name ubi8-repo-sync \
--volume /export/rhel/ubi:/export \
--volume ./root/releases.txt:/releases.txt \
--volume ./root/requirements.txt:/requirements.txt \
--rm \
localhost/ubi8-repo-sync
