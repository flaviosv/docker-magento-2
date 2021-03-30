chmod a+x scripts/*

./build_and_run.sh

magento setup:install --base-url=http://dev.magento.local --db-host=199.192.0.10 --db-name=magento --db-user=root --db-password=root --admin-firstname=Magento --admin-lastname=Admin --admin-email=magento.admin@magentoadmin.com --admin-user=admin --admin-password=123qwe123 --language=en_US --currency=USD --timezone=America/Sao_Paulo --use-rewrites=1  --elasticsearch-host=199.192.0.14 --elasticsearch-port=9200

docker-compose build \
    --build-arg USER=$USER \
    --build-arg UID=$(id -u ${USER}) \
    --build-arg GROUP=$(id -gn ${USER}) \
    --build-arg GID=$(id -g ${USER}) \
    ; \
 docker-compose up

 rm -rfv install; composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.2 install -vvvv

magento alias

n98 alias

adicionar keys

login com o proprio usuário

Testado apenas no linux