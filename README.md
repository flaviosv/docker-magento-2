# Docker for Magento 2

## Considerations

 - Tested only in Linux Ubuntu 20.4
 - Developed for PHP 7.4 / Magento 2.4 (for PHP 7.3 / Magento 2.3 go to branch php7.3)
 - **DO NOT USE THIS CONTAINER TO PRODUCTION ENVIROMENT**

## How to use

 - Clone the project in any folder
 - In ```docker-compose.yml``` change both volumes on nginx and php-fpm nodes to the path of your 
project
 - In terminal and inside the container project folder, run ```chmod a+x ./scripts```
 - Run ```./build_and_run.sh```, this command will build and run all the container
 - To enter in the container, run ```docker exec -it flaviosv-magento-<image_name> ​/bin/ash```
 - If you are into the php-fpm container, **ALWAYS** log in to the same user of your computer, using ```su <your user>```, if you don't do that, you will face permission problems


## Available commands 

 - ```./build_and_run.sh``` build the docker-compose.yml file and start the container

## NGINX Configurations

 - Add ```dev.magento.local``` (the default dns for this container) in your /etc/hosts
 - There is a default configuration in ```./nginx/config/sites-enabled```, the default host is mentioned above and you can add new configurations
 - You can customize the nginx default configurations in ```./nginx/config/nginx.conf```
 - **There is support to SSL**

###### You must rebuild the container if you change any configuration

## PHP-FPM Configurations

 - If you want to add your ssh keys to the php-fpm container, just add it in ```./php-fpm/config/keys```
 - You can change the php (php.ini) or php-fpm (magento.conf) configurations in ```./php-fpm/config```

###### You must rebuild the container if you change any configuration or add keys


## Available commands inside PHP-FPM container

 - ```compileall``` run the composer install, setup:upgrade, disable Magento_Csp, compile the assets and php files, disable all the frontend cache and flush the cache
 - ```compiletheme <your theme>``` run all the commands from ```compileall``` but only for an specific theme
 - ```magento``` instead of ```php bin/magento``` to run the magento CLI commands
 - ```n98-magerun2``` to use the [N98 MageRun CLI](https://github.com/netz98/n98-magerun2)
 

###### Feel free to change the commands, you must rebuild the container if you do that