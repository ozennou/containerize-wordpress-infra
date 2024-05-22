FROM alpine:3.18

RUN apk update

RUN apk add --no-cache mariadb \
            mariadb-client

COPY conf/test.cnf /etc/my.cnf.d/test.cnf

COPY tools/script.sh /tmp/script.sh

RUN chmod u+x /tmp/script.sh

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD nc -z 127.0.0.1 3306

ENTRYPOINT [ "/tmp/script.sh" ]