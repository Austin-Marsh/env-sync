FROM registry.access.redhat.com/ubi8

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-8-for-x86_64-baseos-rpms \
--enablerepo=rhel-8-for-x86_64-appstream-rpms \
ansible-core

COPY root/usr/local/bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

CMD ["ansible-collection-sync.bash"]
