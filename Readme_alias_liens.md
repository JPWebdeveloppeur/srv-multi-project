## lien & Alias & Lexique des commandes

# Lien Utile :

➔ https://labo-tech.fr/base-de-connaissance/quelles-sont-les-commandes-de-base-de-docker/


# Alias perso :

➔ Alias docker personalisé

    - dce() { docker exec -it "$@" zsh; }
    - dni() { docker network inspect "$@"; }
    - dip() { docker inspect "$@" | grep "IPAddress"; }


➔ Alias Docker

    - alias dcb="sudo docker-compose up -d --build"
    - alias dcs="sudo docker-compose start"
    - alias dcd="sudo docker-compose stop"
    - alias dls="docker ps -a"
    - alias dnet="sudo docker network ls"
    - alias drn="sudo docker network rm"
    - alias drm="docker rm -f"
    - alias dv="sudo docker volume ls"
