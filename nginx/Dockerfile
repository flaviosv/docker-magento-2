FROM alpine:latest
WORKDIR /mnt

RUN apk update
RUN apk add nginx
RUN apk add vim

ENV MY_USER="magento"
ENV MY_GROUP="nobody"
ENV MY_UID="1000"

RUN adduser  --home /mnt/${MY_USER} --uid ${MY_UID} --shell /bin/ash --ingroup ${MY_GROUP} --disabled-password ${MY_USER}

COPY config /etc/nginx
COPY crt /etc/nginx

RUN mkdir -p /run/nginx

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]