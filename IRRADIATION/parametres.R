
# Librairie pour la résolution numérique d'edo
library(deSolve)

T_half <- 24 # demi-vie de la DC en heures (24h)
d0 <- log(2) / T_half # taux de dégradation de DC (en h^-1)

A_star <- 200 # concentration d'ApoE libre initale
lambda1 <- d0 * 300 # taux de production de DC (en h^-1)

Tmax <- 500 # temps maximum de simulation (en heures)
times <- seq(0, Tmax, by = 0.1) # vecteur de temps pour la simulation (de 0 à Tmax avec un pas de 0.1h)

params_irradiation <- list(
  lambda1 = lambda1,
  lambda2 = 0.0001 * A_star,
  d0 = d0,
  d1 = 3.5,
  d3 = 0.002,
  stress_const = 0.08,
  irr_start = 100, # temps de début de l'irradiation en heures
  irr_amp = 1.5, # amplitude du stress induit par l'irradiation
  tau_rise = 0.2, # temps de montée du stress induit par l'irradiation en heures
  tau_decay = 30, # temps de décroissance du stress induit par l'irradiation en heures
  k1 = 0.001,
  k2 = 0.015,
  k3 = 0.03,
  k4 = 0.08,
  k5 = 0.01,
  k6 = 0,
  
  PC_th = 200,
  nPC = 4,
  
  A_star = A_star, # concentration d'ApoE libre initiale

  # Paramètres spécifiques à la couronne
  CA_max = 180,
  DA_max = 660,
  k_crown = 0.05
)

state0_irradiation <- c(
  DC = 320,
  MC = 1,
  MA = 0,
  MN = 0,
  A = A_star,
  CA = 0,
  DA = 0
)