FROM alpine:3.14

ADD "https://github.com/nobl9/sloctl/releases/download/0.0.55/sloctl-linux-0.0.55.zip" /
RUN unzip /sloctl-linux-0.0.55.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
