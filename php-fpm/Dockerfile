FROM alpine:latest 
WORKDIR /mnt

ARG USER
ARG GROUP
ARG GID
ARG UID

RUN addgroup -g ${GID} ${GROUP}
RUN adduser --home /home/${USER} --uid ${UID} --shell /bin/ash --ingroup ${GROUP} --disabled-password ${USER}

RUN apk add gcc make g++ zlib-dev
RUN apk add vim
RUN apk add git

RUN apk add php7 php7-fpm
RUN apk add php7-bcmath
RUN apk add php7-ctype
RUN apk add php7-curl
RUN apk add php7-dom
RUN apk add php7-gd
RUN apk add php7-iconv
RUN apk add php7-intl
RUN apk add php7-mbstring
RUN apk add php7-openssl
RUN apk add php7-pdo
RUN apk add php7-pdo_mysql
RUN apk add php7-simplexml
RUN apk add php7-soap
RUN apk add php7-xsl
RUN apk add php7-zip
RUN apk add php7-sockets
RUN apk add php7-opcache
RUN apk add php7-pecl-imagick
RUN apk add php7-pecl-apcu
RUN apk add php7-pecl-mcrypt
RUN apk add php7-pdo 
RUN apk add php7-mysqlnd
RUN apk add php7-xml
RUN apk add php7-json
RUN apk add php7-pear
RUN apk add php7-dev
RUN apk add php7-xmlwriter
RUN pecl install xdebug
RUN apk add composer
RUN apk add php7-tokenizer
RUN apk add php7-session
RUN apk add php7-fileinfo
RUN apk add php7-xmlreader

RUN apk add openssh

COPY config/keys /home/${USER}/.ssh
COPY config/.profile /home/${USER}/.profile
COPY config/.ash_aliases /home/${USER}/.ash_aliases

COPY config/magento.conf /etc/php7/php-fpm.d/www.conf
COPY config/php.ini /etc/php7/php.ini

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod a+x /tmp/entrypoint.sh

RUN chown ${USER}:${USER} -Rf /home/${USER}/.ssh

RUN sed -i "s/FPM_USER/${USER}/g" /etc/php7/php-fpm.d/www.conf
RUN sed -i "s/FPM_GROUP/${GROUP}/g" /etc/php7/php-fpm.d/www.conf

RUN composer self-update --1

EXPOSE 9001

CMD ["sh", "/tmp/entrypoint.sh"]ap