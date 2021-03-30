#!/bin/bash

FILE=/etc/php7/php.ini
if docker exec -it flaviosv-magento-php-fpm grep -q zend_extension=/usr/lib/php7/modules/xdebug.so "$FILE"; then
    docker exec -it flaviosv-magento-php-fpm sed -i "s/zend_extension=\/usr\/lib\/php7\/modules\/xdebug.so/;\${XDEBUG}/g" $FILE
    docker exec -it flaviosv-magento-php-fpm pkill php-fpm7
    echo "XDebug disabled"
else
    echo "XDebug is already disabled"
fi