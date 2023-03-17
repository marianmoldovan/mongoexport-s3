FROM alpine:edge

RUN apk update && apk add jq && rm -rf /var/cache/apk/*

RUN apk add --no-cache mongodb-tools aws-cli

ADD export.sh /usr/local/bin/export

CMD /usr/local/bin/export
