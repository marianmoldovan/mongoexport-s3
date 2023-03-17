FROM alpine:latest

RUN apk update && apk add jq curl mongodb-tools aws-cli && rm -rf /var/cache/apk/*
ADD export.sh /usr/local/bin/export
RUN chmod +x /usr/local/bin/export

CMD /usr/local/bin/export
