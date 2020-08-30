#!/bin/sh
set -e

[ -z "${MONGO_HOST}" ] && { echo "Please specify MONGO_HOST" > /dev/stderr; exit 1;}
[ -z "${MONGO_COLLECTION}" ] && { echo "Please specify MONGO_COLLECTION" > /dev/stderr; exit 1;}
[ -z "${S3_BUCKET}" ] && { echo "Please specify S3_BUCKET" > /dev/stderr; exit 1;}
[ -z "${BACKUP_NAME}" ] && { echo "Please specify S3_PATH" > /dev/stderr; exit 1;}

echo "Exporting ${MONGO_COLLECTION} to s3://${S3_BUCKET}/${BACKUP_NAME}"
mongoexport --sort='{start_time: -1}' --collection=${MONGO_COLLECTION} --out=${BACKUP_NAME} --uri=${MONGO_HOST}
echo "Cleaning file"
cat ${BACKUP_NAME} | jq -c 'del(._id) | if .start_time|type == "object" then .start_time=.start_time["$date"] else .start_time="1970-01-01T00:00:00Z" end | .start_time |= sub("\\.[0-9]{1,3}"; "") | if .stop_time|type == "object" then .stop_time=.stop_time["$date"] else .stop_time="1970-01-01T00:00:00Z" end | .stop_time |= sub("\\.[0-9]{1,3}"; "")' > clean.json 2>/dev/null
echo "Uploading file"
aws s3 cp clean.json s3://${S3_BUCKET}/${BACKUP_NAME}
echo "Exporting completed"
