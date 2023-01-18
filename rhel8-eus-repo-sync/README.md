# build
podman build -t rhel8-eus-repo-sync .

# shell
podman run --rm -it rhel8-eus-repo-sync /bin/bash

# run
podman run \
--name rhel8-repo-sync \
--volume /export/rhel/rhel8:/export \
--volume ./root/etc/yum/vars/releasever:/etc/yum/vars/releasever \
--volume ./root/requirements.txt:/requirements.txt \
--rm \
localhost/rhel8-eus-repo-sync
