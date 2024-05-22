FROM alpine:3.18

RUN apk update

RUN apk add --no-cache apache2-utils

RUN wget https://github.com/portainer/portainer/releases/download/2.19.5/portainer-2.19.5-linux-amd64.tar.gz

RUN tar -xzf portainer-2.19.5-linux-amd64.tar.gz 

RUN rm portainer-2.19.5-linux-amd64.tar.gz 

COPY tools/script.sh /tmp/script.sh

RUN chmod u+x /tmp/script.sh

EXPOSE 9443

ENTRYPOINT [ "/tmp/script.sh" ]