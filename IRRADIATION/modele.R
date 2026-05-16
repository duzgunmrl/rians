rians_model <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    
    # Fonction d'irradiation normalisée
    Irr_raw <- function(t) {
      dt <- t - irr_start
      if (dt <= 0) return(0)
      (1 - exp(-dt / tau_rise)) * exp(-dt / tau_decay)
    }
    
    # Normalisation de l'irradiation
    dt_star <- tau_rise * log(1 + tau_decay / tau_rise)
    Imax <- (1 - exp(-dt_star / tau_rise)) * exp(-dt_star / tau_decay)
    
    # Calcul de l'irradiation normalisée et du stress total
    Irr <- ifelse(t <= irr_start, 0, Irr_raw(t) / Imax)
    s <- stress_const + irr_amp * Irr
    
    # Couronne périnucléaire totale
    PC <- CA + DA
    
    # Inhibition de l'entrée nucléaire par la couronne
    k3_eff <- k3 / (1 + (PC / PC_th)^nPC)
    
    # Formation du complexe ApoE-ATM sans saturation
    formation_CA <- k4 * A * MA
    
    # Formation de la couronne structurée sans saturation
    formation_DA <- 0.5 * k5 * MA^2 + k_crown * CA
    
    # Cytoplasme
    dDC <- lambda1 - d0 * DC + 0.5 * k1 * MC^2 - s * DC
    
    dMC <- -k1 * MC^2 - k2 * MC + k6 * MA + 2 * s * DC
    
    # Région périnucléaire
    dMA <- k2 * MC - k3 * MA - formation_CA - k5 * MA^2 - k6 * MA + 2 * stress_const * DA + s * CA
    
    # Noyau
    dMN <- k3_eff * MA - d1 * MN
    
    # ApoE libre
    dA <- lambda2 - d3 * A - formation_CA + s * CA
    
    # Complexes ApoE-ATM
    dCA <- formation_CA - s * CA
    
    # Dimères périnucléaires
    dDA <- formation_DA - s * DA
    
    list(c(dDC, dMC, dMA, dMN, dA, dCA, dDA))
  })
}