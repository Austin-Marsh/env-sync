FROM registry.access.redhat.com/ubi7

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
iputils \
yum-utils \
createrepo

COPY root/usr/local/bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

CMD ["rhel7-thirdparty-repo-sync.bash"]
