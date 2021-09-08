FROM alpine:3.10

ADD "https://github.com/nobl9/sloctl/releases/download/0.0.55/sloctl-linux-0.0.55.zip" /usr/local/bin
RUN unzip /usr/local/bin/sloctl-linux-0.0.55.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh", "-l", "-c"]
