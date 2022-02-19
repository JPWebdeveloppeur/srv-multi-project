# Docker environnement Php 8.0.13-apache for Symfony 6

Il s'agit d'une image Docker qui vous permet d'avoir un environnement de développement local pour le projet Goa avec PHP 8.0.13, MySQL et phpMyAdmin.

Outre l'image de base Apache PHP 8.0.13, l'environnement comprend également les modules suivants:

```
* apcu 	        * mbstring         * simpleXML
* calendar      * mysqli           * soap
* Core 	        * mysqlnd          * sodium
* ctype         * openssl          * SPL
* curl 	        * mysqlnd          * sqlite3
* date          * pcre             * standard
* dom           * PDO              * spl
* fileinfo      * pdo_mysql        * tokenizer
* filter        * standard         * xdebug
* ftp           * pdo_sqlite       * xml
* gd            * phar             * xmlreader
* hash          * posix            * xmlwriter
* iconv         * readline         * xsl
* intl          * redis            * Zend OPcache
* json          * Reflection       * zip 
* libxml        * session          * zlib 
```

**Note:**  Vous pouvez, si vous souhaitez, rajouter des extensions via le "Dockerfile" qui se trouve dans chaque Instance projet "name_projet/docker/php/dockerfile"

### Structure Projet & Dossier

```
- /srv-multi-project # Repertoire parents 
    - /docker_data/bdd  # Contiendra les bases de données
    - /project-1     # Contient le projet Goacar-bo
        - /project-1/docker/php/
            - /project-1/docker/php/config   # Contient le php.ini
            - /project-1/docker/php/vhosts   # Contient la conf apache
            - /project-1/docker/php/xdebug   # Contient la conf pour xdebug
            - /project-1/docker/php/Dockerfile 
    - /srv_client   # Contient le projet srv_client
        - /srv_client/docker/php/
            - /srv_client/docker/php/config   # Contient le php.ini
            - /srv_client/docker/php/vhosts   # Contient la conf apache
            - /srv_client/docker/php/xdebug   # Contient la conf pour xdebug
            - /srv_client/docker/php/Dockerfile 
    - /srv_employee # Contient le projet srv_employee
        - /srv_employee/docker/php # Contient la config
            - /srv_employee/docker/php/config   # Contient le php.ini
            - /srv_employee/docker/php/vhosts   # Contient la conf apache
            - /srv_employee/docker/php/xdebug   # Contient la conf pour xdebug
            - /srv_employee/docker/php/Dockerfile 
    
    - docker-compose.yml # Orchestrer vos conteneurs Mysql et Phpmyadmin
    - Makefile
```

# Démarrage de l'environnement de développement avec PHP, MySQL et phpMyAdmin

➔ Ouvrez un terminal type bash et placez-vous dans le répertoire Goa puis saisir :

```
 docker-compose up -d ou docker-compose up --build
```

➔ Pour accéder au shell d'un conteneur, il faut lancer la commande suivante :

```
 docker exec -it container_name zsh ou bash 
```

➔ Récuperer les .env-local de chaque projet

➔ On va commencé par le projet "srv_employee", donc dans le terminal saisir les commandes suivantes:

```
 - cd srv_employee

 ```

➔ Dans le .env-local voici la ligne à remplacer sinon, vous aurez des erreurs !
```
    DATABASE_URL="mysql://root:root@mysql:3306/srv_employee?serverVersion=5.7"
```
puis
```
 - docker-compose up -d --build
 - docker exec -it docker_srvemployee_apache_php zsh
 - composer install
 - php bin/console doctrine:database:create
 - php bin/console doctrine:migrations:migrate
 - php bin/console doctrine:fixtures:load
 - yarn install
 - yarn watch
 
```

➔ Voici l'url pour l'application web :
[http://srvemployee.bo/](http://srvemployee.bo/)


➔ On va maintenant aller sur le projet "srv_client", dans le terminal saisir les commandes suivantes:
```
 - cd srv_client
```

➔ Dans le .env-local voici la ligne à remplacer.
```
  DATABASE_URL="mysql://root:root@mysql:3306/srv_client?serverVersion=5.7"
```
puis
```
 - docker-compose up -d --build
 - docker exec -it docker_srvclient_apache_php zsh
 - composer install
 - php bin/console doctrine:database:create
 - php bin/console doctrine:migrations:migrate
 
```
➔ Voici l'url pour l'application web :
[http://srvclient.bo/](http://srvclient.bo/)


➔ On va finir par le projet "goacar-bo", dans le terminal saisir les commandes suivantes:

```
 - cd goacar-bo
 - docker-compose up -d --build
 ```
➔ Il faut maintenant récuperer les ip des containers pour les mettre dans le .env-local, pour cela il vous suffit de faire :
```
 - docker network inspect goa_network
```
➔ Dans la partie "Containers" vous aurez tous vos containers avec leurs ip respectives, du coup il vous suffit juste de les récupérés remplacer dans les lignes suivantes du .env-local:

```
DATABASE_URL="mysql://root:root@mysql:3306/goacar?serverVersion=5.7"
###< doctrine/doctrine-bundle ###
APP_USER_BASE_URL="http://srvemployee.bo"
APP_USER_ENDPOINT='http://adresse_ip/api/v1/users'
APP_COMPANY_ENDPOINT='http://adresse_ip/api/v1/companies'
APP_DOMAIN_ENDPOINT='http://adresse_ip/api/v1/domains'

APP_CLIENT_ENDPOINT='http://adresse_ip/api/v1/clients'
```
maintenant

```
 - docker exec -it docker_goacarbo_apache_php zsh
 - composer install
 - php bin/console doctrine:database:create
 - php bin/console doctrine:migrations:migrate
 - php bin/console doctrine:fixtures:load
 - yarn install
 - yarn watch

 ## Import vehicles from carshop
    - php bin/console import:vehicles:carshop

 ## Import sale points from carshop
    - php bin/console import:sale-points:carshop
 
```
➔ Voici l'url pour l'application web :
[http://goacar.bo/](http://goacar.bo/)

➔ Ps : Pour les utilisateurs de Linux pensé mettre à jour le fichier hosts comme ceci : 
```
 - sudo vim /etc/hosts
```
et dans le fichier 

```
# Project ByMyCar & Goa
172.18.0.3      local.bymycar.fr
172.25.0.6      goacar.bo
172.25.0.4      srvemployee.bo
172.25.0.5      srvclient.bo
```

Enregistrer et quitter 

# Memento Docker 

➔ Lien & Alias [Lien & Alias](Readme_alias_liens.md)

# Installez Xdebug 3 dans le conteneur PHP

➔ [Procédure Xdebug ](Readme_xdebug.md)

# MakeFile

➔ Lance tous les containers 
```
 - make up
```

➔ Stop tous les containers 
```
 - make down
```
 
