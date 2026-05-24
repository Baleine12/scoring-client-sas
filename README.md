# Scoring client avec SAS

## Présentation du projet

Ce projet a pour objectif de construire un score simple de risque de départ client à partir d'une base de données simulée.
L'idée est de reproduire une situation classique en analyse de données, une entreprise souhaite identifier les clients qui risquent de partir afin de mieux comprendre leur profil et de mettre en place des actions de fidélisation.
Le projet est réalisé avec SAS.

## Objectif

L'objectif est de prédire la variable `churn`

Cette variable vaut :

 `1` si le client quitte l'entreprise 
 `0` si le client reste.

À partir des caractéristiques des clients, le programme construit un score de risque appelé `score_churn`. Ce score correspond à une probabilité estimée de départ du client.

## Variables utilisées

La base simulée contient plusieurs variables :

- `age` : âge du client 
- `revenu` : revenu mensuel estimé 
- `anciennete` : ancienneté du client en mois 
- `satisfaction` : score de satisfaction du client 
- `reclamations` : nombre de réclamations du client 
- `utilisation` : fréquence d'utilisation du service 
- `contrat` : type de contrat du client 
- `churn` : départ ou non du client.

## Méthode

Le projet suit plusieurs étapes 

 création d'une base client simulée 
 aperçu des premières observations 
 statistiques descriptives ;
 étude de la répartition de la variable `churn` 
 analyse du churn selon le type de contrat 
 comparaison des moyennes selon le churn 
 estimation d'une régression logistique 
 création d'un score de risque 
 classement des clients en trois groupes de risque 
 export des résultats.

## Modèle utilisé

Le modèle principal utilisé est une régression logistique.
Ce modèle est adapté car la variable à expliquer est binaire : le client part ou ne part pas.
Le modèle permet d'estimer la probabilité qu'un client quitte l'entreprise en fonction de ses caractéristiques.

## Classes de risque

Après l'estimation du modèle, les clients sont classés en trois groupes 

- risque faible 
- risque moyen 
- risque élevé.

Cette classification permet de rendre le résultat plus lisible et plus facile à interpréter.

## Interprétation

Ce projet permet d'identifier les profils de clients les plus exposés au risque de départ.
Par exemple, un client avec une faible satisfaction, plusieurs réclamations, une faible ancienneté ou un contrat mensuel peut présenter un risque plus élevé.
L'objectif n'est donc pas seulement de prédire le churn, mais aussi de mieux comprendre les facteurs liés au départ des clients.

