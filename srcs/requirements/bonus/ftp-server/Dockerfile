FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd 

COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]