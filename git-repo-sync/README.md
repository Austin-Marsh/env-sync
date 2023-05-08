# build
podman build -t git-repo-sync .

# shell
podman run --rm -it git-repo-sync /bin/bash

# run
podman run \
--name git-repo-sync \
--volume /export/git:/export \
--volume ./root/projects:/projects \
--rm \
localhost/git-repo-sync
