#!/bin/bash

RELEASES_FILE="/releases.txt"
REPO_FILE="/requirements.txt"
EXPORT_DIR="/export"

if [ ! -f ${RELEASES_FILE} ]; then echo "[ERROR] Releases file (${RELEASES_FILE}) is missing"; exit; fi
if [ ! -f ${REPO_FILE} ]; then echo "[ERROR] Repository file (${REPO_FILE}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for RELEASE in $(grep -v "#" ${RELEASES_FILE})
do
	echo ${RELEASE} > /etc/yum/vars/releasever

	for REPO in $(grep -v "#" ${REPO_FILE})
	do
		echo [${REPO}] && \
		echo -e && \
		reposync -p "${EXPORT_DIR}/${RELEASE}" --download-metadata --delete --repoid="${REPO}" && \
		echo -e
	done
done
