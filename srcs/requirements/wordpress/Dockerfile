FROM alpine:3.18

RUN apk update

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp-cli.phar && \
    chmod u+x /bin/wp-cli.phar

RUN apk add --no-cache php81 \
            php81-fpm        \
            php81-phar       \
            php81-curl       \
            php81-mysqli     \
            php81-mbstring   \
            php81-tokenizer  \
            php81-redis      \
            mariadb-client   \
            php81-ctype      \
            redis

COPY conf/test.conf /etc/php81/php-fpm.d/www.conf

COPY tools/script.sh /tmp/script.sh

RUN chmod u+x /tmp/script.sh

COPY tools/check.sh /tmp/check.sh

RUN chmod u+x /tmp/check.sh


HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD /bin/sh /tmp/check.sh || exit 1

ENTRYPOINT [ "/tmp/script.sh" ]