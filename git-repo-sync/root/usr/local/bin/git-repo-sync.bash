#!/bin/bash

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -d ${PROJECT_DIR} ]; then echo "[ERROR] Project directory (${PROJECT_DIR}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for PROJECT in $(ls ${PROJECT_DIR})
do
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/requirements.txt"

        echo "[${PROJECT}]" && \
	if [ ! -f ${REQUIREMENTS_FILE} ]; then echo -e; echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"; echo -e; continue; fi && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \

	for REPOSITORY in $(grep -v "#" ${REQUIREMENTS_FILE})
	do
		REPOSITORY_DIR=$(basename ${REPOSITORY} | awk -F '.git$' '{print $1}')

		echo ${REPOSITORY} && \
		git clone --progress ${REPOSITORY} ${REPOSITORY_DIR} && \
		cd ${REPOSITORY_DIR} && \
		git bundle create --progress ../${REPOSITORY_DIR}.bundle --all && \
		cd ../ && \
		rm -rf ${REPOSITORY_DIR} && \
		echo -e ||
		echo -e
	done
done
