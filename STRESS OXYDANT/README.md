# RIANS - Modélisation ATM / ApoE

Projet de modélisation mathématique inspiré du modèle RIANS (Radiation-Induced ATM NucleoShuttling).

## Objectif

Simuler la dynamique des protéines ATM et ApoE dans différents compartiments cellulaires :
- cytoplasme ;
- région périnucléaire ;
- noyau.

Le modèle étudie notamment :
- la dissociation des dimères ATM sous stress ;
- la formation d’une couronne périnucléaire ;
- la séquestration d’ATM ;
- la diminution de la disponibilité nucléaire d’ATM.

## Structure du projet

- `parametres.R`
  Définit les paramètres biologiques et les conditions initiales.

- `modele.R`
  Contient le système d’équations différentielles du modèle RIANS.

- `scenarios.R`
  Lance les simulations numériques avec `deSolve`.

- `plots.R`
  Génère les figures des simulations.

- `main.R`
  Exécute automatiquement l’ensemble du pipeline.

## Lancement

Depuis R :

```r
source("main.R")