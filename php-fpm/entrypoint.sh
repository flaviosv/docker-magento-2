#!/bin/bash

if [ -e /mnt/bin/magento ] 
then 
    ln -s /mnt/bin/magento /usr/bin/magento 
fi

if [ ! -e /usr/bin/n98-magerun2.phar ] 
then
    wget https://files.magerun.net/n98-magerun2.phar

    mv ./n98-magerun2.phar /usr/bin/n98-magerun2.phar
    chmod a+x /usr/bin/n98-magerun2.phar
fi

php-fpm7 -F