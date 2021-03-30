#!/bin/bash

FILE=/etc/php7/php.ini
if docker exec -it flaviosv-magento-php-fpm grep -q \;\$\{XDEBUG\} "$FILE"; then
    docker exec -it flaviosv-magento-php-fpm sed -i "s/;\${XDEBUG}/zend_extension=\/usr\/lib\/php7\/modules\/xdebug.so/g" $FILE
    docker exec -it flaviosv-magento-php-fpm pkill php-fpm7
    echo "XDebug enabled"
else
    echo "XDebug is already enabled"
fi