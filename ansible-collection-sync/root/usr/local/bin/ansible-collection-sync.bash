#!/bin/bash

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -d ${PROJECT_DIR} ]; then echo "[ERROR] Project directory (${PROJECT_DIR}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for PROJECT in `ls ${PROJECT_DIR}`
do
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/requirements.yml"

        echo "[${PROJECT}]" && \
	if [ ! -f ${REQUIREMENTS_FILE} ]; then echo -e; echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"; echo -e; fi && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	ansible-galaxy collection download -r ${REQUIREMENTS_FILE} -p . && \
	echo -e
done
