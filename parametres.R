library(deSolve)

T_half <- 24
d0 <- log(2) / T_half

A_star <- 200
lambda1 <- d0 * 300

Tmax <- 500
times <- seq(0, Tmax, by = 0.1)

params_no_stress <- list(
  lambda1 = lambda1,
  d0 = d0,
  d1 = 1,
  k1 = 1,
  k2 = 0,
  k3 = 0,
  k4 = 0,
  k5 = 1,
  k6 = 0,
  lambda2 = 0,
  d3 = 0,
  d_CA = 0,
  d_DA = 0,
  stress_const = 0
)

params_stress <- list(
  lambda1 = lambda1,
  d0 = d0,
  d1 = 3.5,
  k1 = 0.001,
  k2 = 0.015,
  k3 = 0.03,
  k4 = 0.08,
  k5 = 0.01,
  k6 = 0,
  lambda2 = 0.002 * A_star,
  d3 = 0.002,
  d_CA = 0.002,
  d_DA = 0.007,
  stress_const = 0.08,
  PC_th = 200,
  nPC = 4
)

state0_no_stress <- c(DC = 320, MC = 0, MA = 0, MN = 0, A = A_star, CA = 0, DA = 0)
state0_stress    <- c(DC = 320, MC = 1, MA = 0, MN = 0, A = A_star, CA = 0, DA = 0)