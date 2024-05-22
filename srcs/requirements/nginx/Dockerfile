FROM alpine:3.18

RUN apk update

RUN apk add --no-cache nginx \
            openssl

COPY conf/wordpress.conf /etc/nginx/http.d/wordpress.conf

RUN mkdir -p var/www/

#https://ubuntu.com/blog/avoiding-dropped-connections-in-nginx-containers-with-stopsignal-sigquit
STOPSIGNAL SIGQUIT

COPY tools/script.sh /tmp/script.sh

RUN chmod u+x /tmp/script.sh

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD (nginx -t && wget --no-check-certificate --spider https://127.0.0.1:443) || exit 1

ENTRYPOINT [ "/tmp/script.sh" ]