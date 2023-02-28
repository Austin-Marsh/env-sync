# build
podman build -t ansible-collection-sync .

# shell
podman run --rm -it ansible-collection-sync /bin/bash

# run
podman run \
--name ansible-collection-sync \
--volume /export/ansible:/export \
--volume ./root/projects:/projects \
--rm \
localhost/ansible-collection-sync
