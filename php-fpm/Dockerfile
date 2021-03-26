FROM alpine:latest 
WORKDIR /mnt

ENV MY_USER="magento"
ENV MY_GROUP="nobody"
ENV MY_UID="1000"

RUN adduser --home /home/${MY_USER} --uid ${MY_UID} --shell /bin/ash --ingroup ${MY_GROUP} --disabled-password ${MY_USER}

RUN apk add gcc make g++ zlib-dev
RUN apk add vim
RUN apk add git

RUN apk add php7 php7-fpm
RUN apk add php7-bcmath
RUN apk add php7-ctype
RUN apk add php7-curl
RUN apk add php7-dom
RUN apk add php7-gd
# RUN apk add php7-hash
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

COPY config/keys /home/${MY_USER}/.ssh

COPY config/magento.conf /etc/php7/php-fpm.d/www.conf
COPY config/php.ini /etc/php7/php.ini

RUN chown magento:nobody -Rf /home/${MY_USER}/.ssh

EXPOSE 9001

CMD ["php-fpm7", "-F"]ap