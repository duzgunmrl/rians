# Simulation irradiation
out_irradiation <- as.data.frame(
  ode(
    y = state0_irradiation,
    times = times,
    func = rians_model,
    parms = params_irradiation
  )
)

out_irradiation$PC <- out_irradiation$CA + out_irradiation$DA

# Calcul de l'irradiation normalisée
Irr_raw <- function(t) {
  dt <- t - params_irradiation$irr_start
  if (dt <= 0) return(0)
  (1 - exp(-dt / params_irradiation$tau_rise)) *
    exp(-dt / params_irradiation$tau_decay)
}

# Calcul du maximum théorique du signal d’irradiation afin de normaliser Irr(t) entre 0 et 1
dt_star <- params_irradiation$tau_rise *
  log(1 + params_irradiation$tau_decay / params_irradiation$tau_rise)

Imax <- (1 - exp(-dt_star / params_irradiation$tau_rise)) *
  exp(-dt_star / params_irradiation$tau_decay)

Irr_tN <- function(t) {
  if (t <= params_irradiation$irr_start) return(0)
  Irr_raw(t) / Imax
}

# Calcul de l'irradiation normalisée pour chaque point de temps de la simulation
out_irradiation$Irr <- vapply(out_irradiation$time, Irr_tN, numeric(1))
out_irradiation$s <- params_irradiation$stress_const +
  params_irradiation$irr_amp * out_irradiation$Irr