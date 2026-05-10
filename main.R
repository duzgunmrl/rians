rm(list = ls()) # nettoyer l'environnement de travail en supprimant tous les objets existants pour éviter les conflits et garantir que le script s'exécute dans un environnement propre.

source("parametres.R") # charger les paramètres du modèle 
source("modele.R") # charger la fonction qui définit le modèle de Rians
source("scenarios.R") # simuler les scénarios "sans stress" et "stress constant" en utilisant la fonction ode 
source("plots.R") # générer les graphiques