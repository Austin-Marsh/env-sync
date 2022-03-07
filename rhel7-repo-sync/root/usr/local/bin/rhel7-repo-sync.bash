#!/bin/bash

REPO_FILE="/requirements.txt"
EXPORT_DIR="/export"

if [ ! -f ${REPO_FILE} ]; then echo "[ERROR] Repository file (${REPO_FILE}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for REPO in $(grep -v "#" ${REPO_FILE})
do
	echo [${REPO}] && \
	echo -e && \
	reposync --plugins --download_path=${EXPORT_DIR} --downloadcomps --download-metadata --delete --repoid=${REPO} && \
	if [ -f ${EXPORT_DIR}/${REPO}/comps.xml ]; then createrepo ${EXPORT_DIR}/${REPO} --groupfile comps.xml && rm ${EXPORT_DIR}/${REPO}/comps.xml; \
	else createrepo ${EXPORT_DIR}/${REPO}; fi && \
	if [ -f ${EXPORT_DIR}/${REPO}/*-updateinfo.xml.gz ]; then rm -rf ${EXPORT_DIR}/${REPO}/repodata/*-updateinfo.xml.gz && zcat ${EXPORT_DIR}/${REPO}/*-updateinfo.xml.gz > ${EXPORT_DIR}/${REPO}/repodata/updateinfo.xml && \
	modifyrepo ${EXPORT_DIR}/${REPO}/repodata/updateinfo.xml ${EXPORT_DIR}/${REPO}/repodata/ && rm ${EXPORT_DIR}/${REPO}/*-updateinfo.xml.gz; fi && \
	find ${EXPORT_DIR}/${REPO} -maxdepth 1 -type f -exec rm -f {} \; && \
	echo -e
done
