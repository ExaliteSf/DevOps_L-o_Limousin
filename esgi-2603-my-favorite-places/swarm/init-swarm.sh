#!/bin/sh
# Initialise le Swarm sur le manager et fait rejoindre les 3 nodes

# 1. Init Swarm sur le manager
docker exec swarm-manager docker swarm init --advertise-addr manager

# 2. Récupère le token worker
TOKEN=$(docker exec swarm-manager docker swarm join-token worker -q)

# 3. Fait rejoindre les 3 nodes
docker exec swarm-node1 docker swarm join --token "$TOKEN" manager:2377
docker exec swarm-node2 docker swarm join --token "$TOKEN" manager:2377
docker exec swarm-node3 docker swarm join --token "$TOKEN" manager:2377

# 4. Vérifie le cluster
echo "\n=== Nodes du cluster ==="
docker exec swarm-manager docker node ls
