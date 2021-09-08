FROM alpine:3.10

ADD "https://github.com/nobl9/sloctl/releases/download/$INPUT_SLOCTL_VERSION/sloctl-linux-$INPUT_SLOCTL_VERSION.zip" /usr/local/bin


COPY entrypoint.sh /entrypoint.sh

COPY config.toml ~/.config/nobl9/config.toml
RUN echo '    clientId = "${INPUT_CLIENT_ID}"' >> ~/.config/nobl9/config.toml
RUN echo '    clientSecret = "${INPUT_CLIENT_SECRET}"' >> ~/.config/nobl9/config.toml
RUN echo '    accessToken = "${INPUT_ACCESS_TOKEN}"' >> ~/.config/nobl9/config.toml
RUN echo '    project = "${INPUT_PROJECT}"' >> ~/.config/nobl9/config.toml

ENTRYPOINT ["/entrypoint.sh"]