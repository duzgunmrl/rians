rm(list = ls()) 

source("parametres.R") # charger les paramètres du modèle 
source("modele.R") # charger la fonction qui définit le modèle de Rians
source("scenarios.R") # simuler les scénarios "sans stress" et "stress constant" en utilisant la fonction ode 
source("plots.R") # générer les graphiques

