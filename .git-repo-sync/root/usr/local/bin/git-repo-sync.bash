#!/bin/bash

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -d ${PROJECT_DIR} ]; then echo "[ERROR] Project directory (${PROJECT_DIR}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for PROJECT in `ls ${PROJECT_DIR}`
do
	REPOSITORY_FILE="${PROJECT_DIR}/${PROJECT}/repository.txt"
	BRANCH_FILE="${PROJECT_DIR}/${PROJECT}/branches.txt"
	TAG_FILE="${PROJECT_DIR}/${PROJECT}/tags.txt"

        echo "[${PROJECT}]" && \
	if [ ! -f ${REPOSITORY_FILE} ]; then echo -e; echo "[ERROR] Repository file (${REPOSITORY_FILE}) is missing"; echo -e; continue; fi && \
	if [ ! -f ${BRANCH_FILE} ]; then echo -e; echo "[ERROR] Branches file (${BRANCH_FILE}) is missing"; echo -e; continue; fi && \
	if [ ! -f ${TAG_FILE} ]; then echo -e; echo "[ERROR] Tags file (${TAG_FILE}) is missing"; echo -e; continue; fi && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT}/{tags,branches} && \
	cd ${EXPORT_DIR}/${PROJECT} && \

	source ${REPOSITORY_FILE} && \

	for BRANCH in $(grep -v "#" ${BRANCH_FILE})
	do
		echo ${PROJECT}/${BRANCH} && \
		echo -e && \
		cd ${EXPORT_DIR}/${PROJECT}/branches && curl -sS -k -XGET ${BRANCH_URL}/${BRANCH} -J -O; cd .. && \
		sleep 3 && \
		echo -e
	done

	for TAG in $(grep -v "#" ${TAG_FILE})
	do
		echo ${PROJECT}/${TAG} && \
		echo -e && \
		cd ${EXPORT_DIR}/${PROJECT}/tags && curl -sS -k -XGET ${TAG_URL}/${TAG} -J -O; cd .. && \
		sleep 3 && \
		echo -e
	done
done
