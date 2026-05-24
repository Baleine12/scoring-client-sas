# Scoring client avec SAS

## Présentation du projet

Ce projet a pour objectif de construire un score simple de risque de départ client à partir d'une base simulée.

L'idée c'est de reproduire une situation classique en analyse de données, une entreprise souhaite identifier les clients qui risquent de partir pour mieux comprendre leur profil et éventuellement mettre en place des actions de fidélisation.
Le projet est réalisé avec SAS.

## Objectif

L'objectif est de prédire la variable `churn`.

Cette variable vaut :

- `1` si le client quitte l'entreprise 
- `0` si le client reste.

À partir des caractéristiques des clients le programme construit un score de risque appelé `score_churn`.

## Variables utilisées

La base simulée contient plusieurs variables :

- `age` : âge du client 
- `revenu` : revenu mensuel estimé 
- `anciennete` : ancienneté du client en mois 
- `satisfaction` : score de satisfaction du client 
- `reclamations` : nombre de réclamations 
- `utilisation` : fréquence d'utilisation du service 
- `contrat` : type de contrat 
- `churn` : départ ou non du client.

## Méthode

Le projet suit plusieurs étapes

1. création d'une base client simulée 
2. statistiques descriptives 
3. analyse du churn selon le type de contrat 
4. comparaison des moyennes selon le churn 
5. estimation d'une régression logistique 
6. création d'un score de risque 
7. classement des clients en trois groupes : risque faible, moyen ou élevé 
8. export des résultats

## Modèle utilisé

Le modèle principal est une régression logistique.
Ce modèle est adapté car la variable à expliquer est binaire : le client part ou ne part pas.
Le score obtenu permet d'estimer la probabilité qu'un client quitte l'entreprise.

## Interprétation

Le projet permet d'identifier les profils de clients les plus exposés au risque de départ.

Par exemple un client avec une faible satisfaction, plusieurs réclamations, une faible ancienneté ou un contrat mensuel peut présenter un risque plus élevé.

L'objectif est pas seulement de prédire mais aussi de comprendre les facteurs liés au churn.

## Fichiers générés

Le programme exporte deux fichiers :

- `donnees/clients_simules.csv` : base client simulée 
- `sorties/resultats_scoring.csv` : base avec le score de churn et la classe de risque.

