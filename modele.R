# Modele Rians qui prends en entree le temps, les etats et les parametres, et qui retourne les derivees de chaque variable d'etat
rians_model <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), { # faciliter l'écriture 

    s <- stress_const

    dDC <- lambda1 - d0 * DC + 0.5 * k1 * MC^2 - s * DC

    dMC <- -k1 * MC^2 - k2 * MC + k6 * MA + 2 * s * DC

    dMA <- k2 * MC - k3 * MA - k4 * A * MA - k5 * MA^2 - k6 * MA + 2 * s * DA + s * CA

    PC <- CA + DA

    # Calcul du taux effectif de k3 en fonction de la concentration de PC.
    # Biologiquement, k3 représente la vitesse à laquelle les molécules de MA sont transférées en MN.
    # Si la concentration de PC est élevée, cela peut inhiber cette conversion, ce qui se traduit par une réduction de k3.
    # L'inhibition est modélisée à l'aide d'une fonction de Hill
    # Concrètement, plus la concentration de PC est élevée par rapport au seuil PC_th, plus k3_eff devient petit, ce qui ralentit la conversion de MA en MN.

    if ("PC_th" %in% names(parameters)) {
      k3_eff <- k3 / (1 + (PC / PC_th)^nPC) # fonction de Hill pour l'inhibition de k3 par PC
    } else { 
      k3_eff <- k3 # si PC_th n'est pas défini, on utilise k3 sans inhibition (cas du scénario sans stress)
    }

    dMN <- k3_eff * MA - d1 * MN

    dA <- lambda2 - d3 * A - k4 * A * MA + s * CA

    dCA <- k4 * A * MA - s * CA

    dDA <- 0.5 * k5 * MA^2 - s * DA

    list(c(dDC, dMC, dMA, dMN, dA, dCA, dDA))
  })
}