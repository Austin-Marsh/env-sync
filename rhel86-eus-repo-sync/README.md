# build
podman build -t rhel86-eus-repo-sync .

# shell
podman run --rm -it rhel86-eus-repo-sync /bin/bash

# run
podman run \
--name rhel86-eus-repo-sync \
--volume /export/rhel:/export \
--volume ./root/releases.txt:/releases.txt \
--volume ./root/requirements.txt:/requirements.txt \
--rm \
localhost/rhel86-eus-repo-sync
