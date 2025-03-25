#!/bin/sh
set -e

[ -z "${MONGO_HOST}" ] && { echo "Please specify MONGO_HOST" > /dev/stderr; exit 1;}
[ -z "${MONGO_COLLECTION}" ] && { echo "Please specify MONGO_COLLECTION" > /dev/stderr; exit 1;}
[ -z "${S3_BUCKET}" ] && { echo "Please specify S3_BUCKET" > /dev/stderr; exit 1;}

echo "Exporting linkgenerator to s3://${S3_BUCKET}/linkgenerator.json"
mongoexport --collection=linkgenerator --out=linkgenerator.json --uri=${MONGO_HOST}
echo "Uploading linkgenerator file"
aws s3 cp linkgenerator.json s3://${S3_BUCKET}/linkgenerator.json
echo "Exporting email_opens to s3://${S3_BUCKET}/email_opens.json"
mongoexport --collection=email_opens --out=email_opens.json --uri=${MONGO_HOST}
echo "Uploading email_opens file"
aws s3 cp email_opens.json s3://${S3_BUCKET}/email_opens.json
echo "Exporting qrtracker to s3://${S3_BUCKET}/qrtracker.json"
mongoexport --collection=qrtracker --out=qrtracker.json --uri=${MONGO_HOST}
echo "Uploading qrtracker file"
aws s3 cp qrtracker.json s3://${S3_BUCKET}/qrtracker.json
echo "Exporting review_reply to s3://${S3_BUCKET}/review_reply.json"
mongoexport --collection=review_reply --out=review_reply.json --uri=${MONGO_HOST}
echo "Uploading review_reply file"
aws s3 cp review_reply.json s3://${S3_BUCKET}/review_reply.json
echo "Exporting ai_review_removal to s3://${S3_BUCKET}/ai_review_removal.json"
mongoexport --collection=ai_review_removal --out=ai_review_removal.json --uri=${MONGO_HOST}
echo "Uploading ai_review_removal file"
aws s3 cp ai_review_removal.json s3://${S3_BUCKET}/ai_review_removal.json
echo "Exporting blogs to s3://${S3_BUCKET}/blogs.json"
mongoexport --collection=blogs --out=blogs.json --uri=${MONGO_HOST}
echo "Uploading blogs file"
aws s3 cp blogs.json s3://${S3_BUCKET}/blogs.json
echo "Exporting social_posting to s3://${S3_BUCKET}/social_posting.json"
mongoexport --collection=social_posting --out=social_posting.json --uri=${MONGO_HOST}
echo "Uploading social_posting file"
aws s3 cp social_posting.json s3://${S3_BUCKET}/social_posting.json
echo "Exporting website_forms to s3://${S3_BUCKET}/website_forms.json"
mongoexport --collection=website_forms --out=website_forms.json --uri=${MONGO_HOST}
echo "Uploading website_forms file"
aws s3 cp website_forms.json s3://${S3_BUCKET}/website_forms.json
echo "Exporting twilio_messages_v2 to s3://${S3_BUCKET}/twilio_messages_v2.json"
mongoexport --collection=twilio_messages_v2 --out=twilio_messages_v2.json --uri=${MONGO_HOST}
echo "Uploading twilio_messages_v2 file"
aws s3 cp twilio_messages_v2.json s3://${S3_BUCKET}/twilio_messages_v2.json
echo "Exporting twilio_messages to s3://${S3_BUCKET}/twilio_messages.json"
mongoexport --collection=twilio_messages --out=twilio_messages.json --uri=${MONGO_HOST}
echo "Uploading twilio_messages file"
aws s3 cp twilio_messages.json s3://${S3_BUCKET}/twilio_messages.json
echo "Exporting texting_campaigns to s3://${S3_BUCKET}/texting_campaigns.json"
mongoexport --collection=texting_campaigns --out=texting_campaigns.json --uri=${MONGO_HOST}
echo "Uploading texting_campaigns file"
aws s3 cp texting_campaigns.json s3://${S3_BUCKET}/texting_campaigns.json
echo "Exporting stale_opportunities to s3://${S3_BUCKET}/stale_opportunities.json"
mongoexport --collection=stale_opportunities --out=stale_opportunities.json --uri=${MONGO_HOST}
echo "Uploading stale_opportunities file"
aws s3 cp stale_opportunities.json s3://${S3_BUCKET}/stale_opportunities.json
echo "Exporting events to s3://${S3_BUCKET}/events.json"
mongoexport --collection=events --out=events.json --uri=${MONGO_HOST}
echo "Uploading events file"
aws s3 cp events.json s3://${S3_BUCKET}/events/events.json
echo "Exporting kixie to s3://${S3_BUCKET}/kixie.json"
mongoexport --collection=kixie --out=kixie.json --uri=${MONGO_HOST}
echo "Uploading kixie file"
aws s3 cp kixie.json s3://${S3_BUCKET}/kixie/kixie.json
echo "Exporting kixie_sms to s3://${S3_BUCKET}/kixie_sms.json"
mongoexport --collection=kixie_sms --out=kixie_sms.json --uri=${MONGO_HOST}
echo "Uploading kixie_sms file"
aws s3 cp kixie_sms.json s3://${S3_BUCKET}/kixie/kixie_sms.json
echo "Exporting forms to s3://${S3_BUCKET}/forms.json"
mongoexport --collection=forms --out=forms.json --uri=${MONGO_HOST}
echo "Uploading forms file"
aws s3 cp forms.json s3://${S3_BUCKET}/forms/forms.json
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
mongoexport --collection=privatereviews --out=privatereviews.json --uri=${MONGO_HOST}
echo "Uploading privatereviews file"
aws s3 cp privatereviews.json s3://${S3_BUCKET}/privatereviews/privatereviews.json
mongoexport --collection=bookingconfirmed --out=bookingconfirmed.json --uri=${MONGO_HOST}
echo "Uploading bookingconfirmed file"
aws s3 cp bookingconfirmed.json s3://${S3_BUCKET}/bookingconfirmed/bookingconfirmed.json
mongoexport --collection=newreviews --out=newreviews.json --uri=${MONGO_HOST}
echo "Uploading newreviews file"
aws s3 cp newreviews.json s3://${S3_BUCKET}/newreviews/newreviews.json
mongoexport --collection=spintowin --out=spintowin.json --uri=${MONGO_HOST}
echo "Uploading spintowin file"
aws s3 cp spintowin.json s3://${S3_BUCKET}/spintowin/spintowin.json
echo "Exporting adv_chatbot"
mongoexport --collection=adv_chatbot --out=adv_chatbot.json --uri=${MONGO_HOST}
echo "Uploading adv_chatbot file"
aws s3 cp adv_chatbot.json s3://${S3_BUCKET}/adv_chatbot/adv_chatbot.json
echo "Exporting ${MONGO_COLLECTION} to s3://${S3_BUCKET}/chatbot.json"
mongoexport --query '{"_id":{"$gt":{"$oid":"677486008af534000886e6d5"}}}' --sort='{start_time: -1}' --collection=${MONGO_COLLECTION} --out=chatbot.json --uri=${MONGO_HOST}
echo "Cleaning file"
cat chatbot.json | jq -c 'del(._id) | if .start_time|type == "object" then .start_time=.start_time["$date"] else .start_time="2000-01-01T00:00:00Z" end | .start_time |= sub("\\.[0-9]{1,3}"; "") | if .stop_time|type == "object" then .stop_time=.stop_time["$date"] else .stop_time="2000-01-01T00:00:00Z" end | .stop_time |= sub("\\.[0-9]{1,3}"; "") | if .phone ==null then .phone="" else .phone=.phone end | if .dob ==null then .dob="" else .dob=.dob end' > clean.json 2>/dev/null
echo "Sorting file"
jq -S -c '.' clean.json  > sorted.json
echo "Uploading file"
aws s3 cp sorted.json s3://${S3_BUCKET}/chatbot/chatbot_2025.json
echo "Exporting completed."
