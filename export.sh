#!/bin/sh
set -e

[ -z "${MONGO_HOST}" ] && { echo "Please specify MONGO_HOST" > /dev/stderr; exit 1;}
[ -z "${MONGO_COLLECTION}" ] && { echo "Please specify MONGO_COLLECTION" > /dev/stderr; exit 1;}
[ -z "${S3_BUCKET}" ] && { echo "Please specify S3_BUCKET" > /dev/stderr; exit 1;}
[ -z "${BACKUP_NAME}" ] && { echo "Please specify S3_PATH" > /dev/stderr; exit 1;}

echo "Exporting ${MONGO_COLLECTION} to s3://${S3_BUCKET}/${BACKUP_NAME}"
mongoexport  --collection=${MONGO_COLLECTION} --out=${BACKUP_NAME} --uri=${MONGO_HOST}
aws s3 cp ${BACKUP_NAME} s3://${S3_BUCKET}/${BACKUP_NAME}
echo "Exporting completed"
