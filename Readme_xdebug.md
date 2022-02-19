# Installez Xdebug 3 dans le conteneur PHP

➔ Configurez Xdebug dans votre IDE ou éditeur de texte, Maintenant que nous avons fini de configurer le conteneur PHP, nous devons configurer notre client.
Cela variera en fonction du client que vous utilisez. Pour mes besoins, j'utilise PhpStorm.

![Screenshot](https://www.zupimages.net/up/21/45/1xvm.jpg)


➔ Ce sont les paramètres de débogage par défaut, que vous pouvez trouver sous Paramètres › PHP › Debug › Xdebug, utilisez les valeurs par défaut de Xdebug, que nous n'avons pas modifiées dans notre configuration.

➔ Toujours dans les settings, pensez à mapper votre projet "File > settings > Php > Server ".

➔ Pour le port, prendre celui qui se trouve dans le docker-compose de votre projet.

![Screenshot](https://i.imgur.com/b4CaoZM.png)

Donc, la seule chose que nous devons faire est de lui dire de commencer à écouter les connexions PHP Debug, en basculant l'icône du téléphone dans la barre de menu supérieure.

Cependant, je recommande d'activer "Arrêt à la première ligne dans les scripts PHP" lors de la configuration initiale, comme moyen supplémentaire de savoir si le débogage par étapes fonctionne au premier essai, lorsqu'aucun point d'arrêt n'est défini.

![Screenshot](https://i.imgur.com/VyhHRMf.png)


➔ Commencez à utiliser le débogage par étapes au lieu de var_dump

À ce stade, vous devez utiliser un éditeur de texte ou un IDE pris en charge qui sait comment parler à Xdebug avec le protocole DBGp ouvert.

J'utilise PhpStorm. Quoi qu'il en soit, une fois que vous avez configuré l'IDE ou l'éditeur de texte de votre choix et que vous êtes prêt à fonctionner, ouvrez le code du projet et définissez un point d'arrêt. 

Ensuite, exécutez le code dans votre navigateur. 

Si tout va bien, vous devriez voir que la requête ne se termine pas dans votre navigateur, c'est plutôt votre éditeur de texte ou IDE qui prend le focus et s'arrête sur le point d'arrêt. 

Vous pouvez en voir l'exemple dans PhpStorm dans la capture d'écran ci-dessous.

![Screenshot](https://i.imgur.com/oJnqkc6.png)


Comment dépanner Xdebug si cela ne fonctionne pas.

Si votre PhpStorm ne s'est pas arrêté au point d'arrêt que vous avez défini, voir le journal de diagnostic de Xdebug via cette commande, juste avant votre point d'arrêt :

```
xdebug_info();
exit;
````

➔ Afficher le journal de diagnostic de Xdebug, et recharger la page. Ceci est pratique lorsque vous souhaitez effectuer un dépannage rapide. 
Lorsque vous exécutez à nouveau l'application, vous verrez une sortie similaire à la capture d'écran ci-dessous.

![Screenshot](https://i.imgur.com/vOhOcgi.jpg)

Pous contrôler la quantité d'informations que Xdebug enregistre voici un tableau rapide

|    Niveau     |   Nom            |  Exemple                 |
| ------------- |------------------|------------------------------------|
|     0         |   Criticals      |   Errors in the configuration      |
|     1         |   Errors         |   Connection errors                |
|     3         |   Warnings       |   Connection warnings              |
|     5         |   Communication  |   Protocol messages                |
|     7         |   Information    |   Information while connecting     |
|     10        |   Debug          |   Breakpoint resolving information |

➔ Après avoir ajouté la nouvelle configuration et enregistré le fichier, redémarrez le conteneur à l'aide de la commande suivante :
```
docker-compose up -d php
```


