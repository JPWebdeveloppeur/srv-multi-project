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
    - /project-2   # Contient le projet srv_client
        - /project-2/docker/php/
            - /project-2/docker/php/config   # Contient le php.ini
            - /project-2/docker/php/vhosts   # Contient la conf apache
            - /project-2/docker/php/xdebug   # Contient la conf pour xdebug
            - /project-2/docker/php/Dockerfile 
    - /project-3 # Contient le projet srv_employee
        - /project-3/docker/php # Contient la config
            - /project-3/docker/php/config   # Contient le php.ini
            - /project-3/docker/php/vhosts   # Contient la conf apache
            - /project-3/docker/php/xdebug   # Contient la conf pour xdebug
            - /project-3/docker/php/Dockerfile 
    
    - docker-compose.yml # Orchestrer vos conteneurs Mysql et Phpmyadmin
    - Makefile
```

# Démarrage de l'environnement de développement avec PHP, MySQL et phpMyAdmin

➔ Ouvrez un terminal type bash et placez-vous dans le répertoire project-1 puis saisir :

```
 docker-compose up -d ou docker-compose up --build
```

➔ Pour accéder au shell d'un conteneur, il faut lancer la commande suivante :

```
 docker exec -it container_name zsh ou bash 
```


➔ Ps : Pour les utilisateurs de Linux pensé mettre à jour le fichier hosts comme ceci : 
```
 - sudo vim /etc/hosts
```
et dans le fichier 

```
# Project ByMyCar & Goa
172.18.0.3      local.fr
172.25.0.6      project-1.bo
172.25.0.4      project-2.bo
172.25.0.5      project-3.bo
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
 
