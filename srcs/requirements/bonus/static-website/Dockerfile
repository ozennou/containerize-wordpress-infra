FROM alpine:3.18

RUN apk update

RUN apk add php81

COPY ./tools /tools

ENTRYPOINT [ "php", "-S", "0.0.0.0:6969", "-t", "/tools"]