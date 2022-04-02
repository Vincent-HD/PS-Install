# Script Powershell d'installation automatique

Tous les scripts qui sont présent dans le dossier scripts et déclarer dans la variable `$install_list` du fichier `install.ps1` sont éxécuter automatiquement.

Cela permet d'ajouter des scripts automatiques d'installation et de configuration de logiciel via des gestionnaires de paquets

Les gestionnaires supportés sont:
1. Winget
2. Chocolatey

Les paquets sont installés **seulement** si ils ne sont **pas** déjà installés

La possibilité de git cloné un projet est possible via la fonction `global:Invoke-GitClone <giturl> <path>`

Le dossier `conf` est destiné à accueillir les possibles fichiers de configurations des logiciels
