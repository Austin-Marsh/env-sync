# build
podman build -t rhel8-thirdparty-repo-sync .

# run
podman run \
--name rhel8-thirdparty-repo-sync \
--volume /export/rhel/rhel8-thirdparty:/export \
--volume ./root/requirements.txt:/requirements.txt \
--volume ./root/etc/yum.repos.d:/etc/yum.repos.d \
--rm \
localhost/rhel8-thirdparty-repo-sync
