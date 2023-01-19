# build
podman build -t rhel8-thirdparty-repo-sync .

# shell
podman run --rm -it rhel8-thirdparty-repo-sync /bin/bash

# run
podman run \
--name rhel8-thirdparty-repo-sync \
--volume /export/rhel:/export \
--volume ./root/releases.txt:/releases.txt \
--volume ./root/requirements.txt:/requirements.txt \
--volume ./root/etc/yum.repos.d:/etc/yum.repos.d \
--rm \
localhost/rhel8-thirdparty-repo-sync
