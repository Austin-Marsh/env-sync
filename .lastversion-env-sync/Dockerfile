FROM registry.access.redhat.com/ubi8

RUN dnf module install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-8-for-x86_64-baseos-rpms \
--enablerepo=rhel-8-for-x86_64-appstream-rpms \
python38

RUN dnf install \
--assumeyes \
krb5-devel

RUN pip3 install \
lastversion

COPY root/usr/local/bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

CMD ["lastversion-env-sync.bash"]
