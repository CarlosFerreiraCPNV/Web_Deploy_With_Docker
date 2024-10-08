#!/bin/bash

echo "Initialisation des conteneurs..."
docker-compose down
docker-compose up -d

echo "Initialisation terminée. Accédez à l'application sur http://localhost:8080"
