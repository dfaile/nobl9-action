FROM alpine:3.10

ADD "https://github.com/nobl9/sloctl/releases/download/0.0.55/sloctl-linux-0.0.55.zip" /usr/local/bin

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
