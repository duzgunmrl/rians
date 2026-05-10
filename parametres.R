# Librairie pour la résolution numérique d'edo
library(deSolve)

T_half <- 24 # demi-vie de la DC en heures (24h)
d0 <- log(2) / T_half # taux de dégradation de DC (en h^-1)

A_star <- 200 # concentration d'ApoE libre initale
lambda1 <- d0 * 300 # taux de production de DC (en h^-1)

Tmax <- 500 # temps maximum de simulation (en heures)
times <- seq(0, Tmax, by = 0.1) # vecteur de temps pour la simulation (de 0 à Tmax avec un pas de 0.1h)

# Liste des paramètres pour les scénarios "sans stress"
params_no_stress <- list(
  lambda1 = lambda1,
  lambda2 = 0,
  d0 = d0,
  d1 = 1,
  d3 = 0,
  k1 = 1,
  k2 = 0,
  k3 = 0,
  k4 = 0,
  k5 = 1,
  k6 = 0,
  stress_const = 0
)

# Liste des paramètres pour les scénarios "stress constant"
params_stress <- list(
  lambda1 = lambda1,
  lambda2 = 0.002 * A_star,
  d0 = d0,
  d1 = 3.5,
  d3 = 0.002,
  k1 = 0.001,
  k2 = 0.015,
  k3 = 0.03,
  k4 = 0.08,
  k5 = 0.01,
  k6 = 0,
  stress_const = 0.08,
  PC_th = 200, # seuil de concentration de PC pour l'inhibition de k3
  nPC = 4 # coefficient de Hill pour l'inhibition de k3 par PC
)

# Conditions initiales pour les scénarios "sans stress" et "stress constant"
state0_no_stress <- c(DC = 320, MC = 0, MA = 0, MN = 0, A = A_star, CA = 0, DA = 0)
state0_stress    <- c(DC = 320, MC = 1, MA = 0, MN = 0, A = A_star, CA = 0, DA = 0)