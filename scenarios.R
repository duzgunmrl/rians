out_no_stress <- as.data.frame(
  ode(
    y = state0_no_stress,
    times = times,
    func = rians_model,
    parms = params_no_stress
  )
)

out_no_stress$PC <- out_no_stress$CA + out_no_stress$DA


out_stress <- as.data.frame(
  ode(
    y = state0_stress,
    times = times,
    func = rians_model,
    parms = params_stress
  )
)

out_stress$PC <- out_stress$CA + out_stress$DA