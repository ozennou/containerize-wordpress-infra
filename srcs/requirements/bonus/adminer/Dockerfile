FROM alpine:3.18

RUN apk --no-cache add php81 php81-session php81-pdo php81-pdo_mysql php81-json curl

RUN mkdir -p /var/www

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/adminer.php

ENTRYPOINT ["php", "-S", "0.0.0.0:9000", "/var/www/adminer.php"]