#!/bin/bash

PRODUCT="Red Hat Enterprise Linux with Smart Virtualization, Premium (2-socket)"

REGISTER_SYSTEM()
{
	subscription-manager remove --all
	subscription-manager unregister
	subscription-manager clean
	subscription-manager register --force --proxy=${PROXY}
	subscription-manager refresh

	if [ ${?} != 0 ]
	then
		echo "[ERROR] Registration failed"
		exit
	fi
}

ATTACH_POOL()
{
	POOL_ID=$(subscription-manager list --available --pool-only --matches="${PRODUCT}" | sort | tail -1)

	subscription-manager attach --pool=${POOL_ID}

	if [ ${?} != 0 ]
	then
		echo "[ERROR] Pool attach failed"
		exit
	fi
}

CONFIGURE_REPOS()
{
	echo "Disabling previously registered repositories"

	subscription-manager repos --proxy=${PROXY} \
	--disable='*' \
	--enable=rhel-8-for-x86_64-baseos-rpms \
	--enable=rhel-8-for-x86_64-appstream-rpms 

	if [ ${?} != 0 ]
        then
                echo "[ERROR] Repo configuration failed"
                exit
        fi

	echo -e
}

REGISTER_SYSTEM && \
ATTACH_POOL && \
CONFIGURE_REPOS
