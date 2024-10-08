# Déploiement Automatisé d'une Application Web avec Docker

## Description
Ce projet consiste à déployer automatiquement une application web WordPress avec une base de données MySQL et un serveur Nginx agissant comme reverse proxy. L'environnement utilise Docker et Docker Compose pour orchestrer les services. Ce guide fournit des instructions pour installer, configurer, sécuriser et déployer cette infrastructure.

## Structure du projet
```arduino
project-root/
├── app/
│   ├── wordpress/
│   │   └── wp-content/
│   └── nginx/
│       └── default.conf
├── config/
│   ├── mysql/
│   │   └── my.cnf
│   └── wordpress/
│       └── wp-config.php
├── docker/
│   ├── wordpress/
│   ├── mysql/
│   └── nginx/
├── prometheus/
│   └── prometheus.yml
├── grafana/
│   └── dashboards/
├── scripts/
│   ├── init-db.sh
│   └── deploy.sh
├── docker-compose.yml
├── docker-compose.prod.yml
├── .env
└── README.md
```
## Prérequis
Avant de commencer, assurez-vous d'avoir les éléments suivants :
- Docker (version 20.10 ou plus récente)
- Docker Compose (version 1.29 ou plus récente)
- Accès à une machine Linux ou macOS (Windows avec WSL peut également fonctionner)

## Installation

### 1. Installation de Docker et Docker Compose
Si Docker et Docker Compose ne sont pas installés sur votre machine, utilisez les commandes suivantes pour les installer :

```bash
sudo apt update
sudo apt install docker.io
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '(?<="tag_name": ")[^"]*')" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
Vérifiez que Docker et Docker Compose sont correctement installés :
```bash
docker --version
docker-compose --version
```

### 2. Clonage du projet
Clonez ce dépôt pour accéder aux fichiers nécessaires à la configuration de votre environnement :
```bash
git clone https://github.com/votre-utilisateur/nom-du-projet.git
cd nom-du-projet
```

### 3. Configuration des fichiers
- Modifiez les fichiers de configuration sous config/wordpress/wp-config.php et config/mysql/my.cnf si nécessaire.
- Assurez-vous que le fichier app/nginx/default.conf configure correctement le serveur Nginx pour agir comme reverse proxy.

### 4. Lancement de l'application
Pour lancer l'application, exécutez le script de déploiement suivant :
```bash
./scripts/deploy.sh
```
Cela va démarrer les services WordPress, MySQL et Nginx en utilisant Docker Compose.

Accédez ensuite à votre application via le navigateur à l'adresse suivante : http://localhost:8080

## Fichiers importants
- docker-compose.yml : Définit les services WordPress, MySQL, et Nginx en environnement de développement.
- docker-compose.prod.yml : Déploiement en production, avec des configurations adaptées à un environnement stable.
- scripts/deploy.sh : Automatisation du déploiement des services.
- app/nginx/default.conf : Fichier de configuration Nginx pour configurer le reverse proxy.
- config/mysql/my.cnf : Fichier de configuration de la base de données MySQL.

## Automatisation
Le projet est automatisé à l'aide de Docker Compose et des scripts Bash :

- docker-compose.yml : Définit et orchestre les conteneurs.
- deploy.sh : Automatisation du déploiement pour un environnement de développement.
- init-db.sh : Script pour initialiser la base de données.

## Mise en production
Pour déployer en production, utilisez le fichier docker-compose.prod.yml :
```bash
docker-compose -f docker-compose.prod.yml up -d
```
Cela va déployer l'application avec des paramètres spécifiques à la production (par exemple, HTTPS activé dans Nginx).

## Sécurité
- Nginx avec HTTPS : Ajoutez un certificat SSL pour sécuriser les connexions.
- Sécurité MySQL : Assurez-vous que la base de données MySQL est protégée et que les accès sont restreints aux services internes.
- Sécurité Docker : Suivez les bonnes pratiques de Docker comme l'utilisation d'images officielles, l'absence de privilèges supplémentaires pour les conteneurs, et la limitation des ports exposés.

## Monitoring
Pour monitorer l'application, des outils comme Prometheus et Grafana sont configurés. Modifiez les fichiers sous prometheus/ et grafana/ pour adapter le monitoring à vos besoins.

## Contact
Pour toute question, contactez-nous à carlos.ferreira1@eduvaud.ch ou theo.nussbaum@eduvaud.ch.