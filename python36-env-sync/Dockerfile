FROM registry.access.redhat.com/ubi8

RUN dnf module install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-8-for-x86_64-baseos-rpms \
--enablerepo=rhel-8-for-x86_64-appstream-rpms \
python36

RUN dnf install \
--assumeyes \
krb5-devel

COPY root/usr/local/bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

CMD ["python36-env-sync.bash"]
