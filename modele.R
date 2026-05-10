rians_model <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {

    s <- stress_const
    PC <- CA + DA

    dDC <- lambda1 - d0 * DC + 0.5 * k1 * MC^2 - s * DC

    dMC <- -k1 * MC^2 -
           k2 * MC +
           k6 * MA +
           2 * s * DC

    dMA <- k2 * MC -
           k3 * MA -
           k4 * A * MA -
           k5 * MA^2 -
           k6 * MA +
           2 * s * DA +
           s * CA

    if ("PC_th" %in% names(parameters)) {
      k3_eff <- k3 / (1 + (PC / PC_th)^nPC)
    } else {
      k3_eff <- k3
    }

    dMN <- k3_eff * MA - d1 * MN

    dA <- lambda2 -
          d3 * A -
          k4 * A * MA +
          s * CA

    dCA <- k4 * A * MA - s * CA - d_CA * CA

    dDA <- 0.5 * k5 * MA^2 - s * DA - d_DA * DA

    list(c(dDC, dMC, dMA, dMN, dA, dCA, dDA))
  })
}