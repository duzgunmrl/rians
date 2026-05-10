# Simulation des scenarios sans stress
out_no_stress <- as.data.frame( # convertir le résultat en tableau de données pour faciliter la manipulation et la visualisation
  ode( # résoudre numériquement le système d’équations différentielles du modèle.
    y = state0_no_stress, # état initial du système
    times = times, # vecteur de temps pour la simulation
    func = rians_model, # fonction qui définit le modèle 
    parms = params_no_stress # liste des paramètres à prendre en compte pour la simulation
  )
)

out_no_stress$PC <- out_no_stress$CA + out_no_stress$DA # calculer la concentration de PC à partir de CA et DA

# Idem, mais pour le scénario avec stress constant
out_stress <- as.data.frame(
  ode(
    y = state0_stress,
    times = times,
    func = rians_model,
    parms = params_stress
  )
)

out_stress$PC <- out_stress$CA + out_stress$DA