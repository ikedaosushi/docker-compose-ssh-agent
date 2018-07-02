FROM alpine:edge

ENV SOCKET_DIR /ssh
ENV SSH_AUTH_SOCK ${SOCKET_DIR}/auth/sock
RUN apk add --update openssh && rm -rf /var/cache/apk/*
COPY ssh-agent-entry.sh /entry.sh
RUN mkdir -p ${SOCKET_DIR} && chmod 777 ${SOCKET_DIR}
VOLUME ${SOCKET_DIR}
ENTRYPOINT ["/entry.sh"]
CMD ["ssh-agent"]