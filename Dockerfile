FROM alpine:3.10

COPY debug.sh /debug.sh
RUN chmod +x /debug.sh
RUN ./debug.sh

ADD "https://github.com/nobl9/sloctl/releases/download/${SLOCTL_VERSION}/sloctl-linux-${SLOCTL_VERSION}.zip" /usr/local/bin


COPY entrypoint.sh /entrypoint.sh
RUN echo 'sloctl apply -f $GITHUB_WORKSPACE/${SLOCTL_YML}' >> /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY config.toml ~/.config/nobl9/config.toml
RUN echo '    clientId = "${CLIENT_ID}"' >> ~/.config/nobl9/config.toml
RUN echo '    clientSecret = "${CLIENT_SECRET}"' >> ~/.config/nobl9/config.toml
RUN echo '    accessToken = "${ACCESS_TOKEN}"' >> ~/.config/nobl9/config.toml
RUN echo '    project = "${PROJECT}"' >> ~/.config/nobl9/config.toml

ENTRYPOINT ["/entrypoint.sh"]