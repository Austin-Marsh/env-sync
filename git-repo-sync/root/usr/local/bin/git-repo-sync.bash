#!/bin/bash

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -d ${PROJECT_DIR} ]; then echo "[ERROR] Project directory (${PROJECT_DIR}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for PROJECT in $(ls ${PROJECT_DIR})
do
	REPOSITORY_FILE="${PROJECT_DIR}/${PROJECT}/requirements.txt"

        echo "[${PROJECT}]" && \
	if [ ! -f ${REPOSITORY_FILE} ]; then echo -e; echo "[ERROR] Repository file (${REPOSITORY_FILE}) is missing"; echo -e; continue; fi && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \

	for REPOSITORY in $(grep -v "#" ${REPOSITORY_FILE})
	do
		REPOSITORY_DIR=$(basename ${REPOSITORY} | awk -F '.git$' '{print $1}')

		git clone --progress ${REPOSITORY} ${REPOSITORY_DIR} && \
		cd ${REPOSITORY_DIR} && \
		git bundle create ../${REPOSITORY_DIR}.bundle --all && \
		cd ../ && \
		rm -rf ${REPOSITORY_DIR} && \
		echo -e ||
		echo -e
	done
done
