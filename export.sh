#!/bin/sh
set -e

[ -z "${MONGO_HOST}" ] && { echo "Please specify MONGO_HOST" > /dev/stderr; exit 1;}
[ -z "${MONGO_COLLECTION}" ] && { echo "Please specify MONGO_COLLECTION" > /dev/stderr; exit 1;}
[ -z "${S3_BUCKET}" ] && { echo "Please specify S3_BUCKET" > /dev/stderr; exit 1;}

echo "Exporting reviewgenerator to s3://${S3_BUCKET}/reviewgenerator.json"
mongoexport --collection=reviewgenerator --out=reviewgenerator.json --uri=${MONGO_HOST}
echo "Uploading reviewgenerator file"
aws s3 cp reviewgenerator.json s3://${S3_BUCKET}/reviewgenerator/reviewgenerator.json
echo "Exporting completed for reviewgenerator"
echo "Exporting texttopay to s3://${S3_BUCKET}/texttopay.json"
mongoexport --collection=texttopay --out=texttopay.json --uri=${MONGO_HOST}
echo "Uploading texttopay file"
aws s3 cp texttopay.json s3://${S3_BUCKET}/texttopay/texttopay.json
echo "Exporting telemedicine to s3://${S3_BUCKET}/telemedicine.json"
mongoexport --collection=telemedicine --out=telemedicine.json --uri=${MONGO_HOST}
echo "Uploading telemedicine file"
aws s3 cp telemedicine.json s3://${S3_BUCKET}/telemedicine/telemedicine.json
echo "Exporting missedcallai to s3://${S3_BUCKET}/missedcallai.json"
mongoexport --collection=missedcallai --out=missedcallai.json --uri=${MONGO_HOST}
echo "Uploading missedcallai file"
aws s3 cp missedcallai.json s3://${S3_BUCKET}/missedcallai/missedcallai.json
echo "Exporting aiautodialer to s3://${S3_BUCKET}/aiautodialer.json"
mongoexport --collection=aiautodialer --out=aiautodialer.json --uri=${MONGO_HOST}
echo "Uploading aiautodialer file"
aws s3 cp aiautodialer.json s3://${S3_BUCKET}/aiautodialer/aiautodialer.json
mongoexport --collection=gmbmessaging --out=gmbmessaging.json --uri=${MONGO_HOST}
echo "Uploading gmbmessaging file"
aws s3 cp gmbmessaging.json s3://${S3_BUCKET}/gmbmessaging/gmbmessaging.json
mongoexport --collection=referralmultiplier_newreferral --out=referralmultiplier_newreferral.json --uri=${MONGO_HOST}
echo "Uploading referralmultiplier_newreferral file"
aws s3 cp referralmultiplier_newreferral.json s3://${S3_BUCKET}/referralmultiplier_newreferral/referralmultiplier_newreferral.json
mongoexport --collection=referralmultiplier_newreferrer --out=referralmultiplier_newreferrer.json --uri=${MONGO_HOST}
echo "Uploading referralmultiplier_newreferrer file"
aws s3 cp referralmultiplier_newreferrer.json s3://${S3_BUCKET}/referralmultiplier_newreferrer/referralmultiplier_newreferrer.json
echo "Exporting ${MONGO_COLLECTION} to s3://${S3_BUCKET}/chatbot.json"
mongoexport --sort='{start_time: -1}' --collection=${MONGO_COLLECTION} --out=chatbot.json --uri=${MONGO_HOST}
echo "Cleaning file"
cat chatbot.json | jq -c 'del(._id) | if .start_time|type == "object" then .start_time=.start_time["$date"] else .start_time="2000-01-01T00:00:00Z" end | .start_time |= sub("\\.[0-9]{1,3}"; "") | if .stop_time|type == "object" then .stop_time=.stop_time["$date"] else .stop_time="2000-01-01T00:00:00Z" end | .stop_time |= sub("\\.[0-9]{1,3}"; "") | if .phone ==null then .phone="" else .phone=.phone end | if .dob ==null then .dob="" else .dob=.dob end' > clean.json 2>/dev/null
echo "Sorting file"
jq -S -c '.' clean.json  > sorted.json
echo "Uploading file"
aws s3 cp sorted.json s3://${S3_BUCKET}/chatbot/chatbot.json
echo "Exporting completed"
