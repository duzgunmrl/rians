plot_par <- function() {
  par(
    mar = c(5.5, 5.5, 4.5, 2),
    mgp = c(3.2, 1.1, 0),
    xaxs = "i",
    bg = "white",
    cex.lab = 1.35,
    cex.main = 1.55,
    cex.axis = 1.15
  )
}

safe_ylim_group <- function(...) {
  xs <- c(...)
  xs <- xs[is.finite(xs)]
  r <- range(xs)
  pad <- 0.05 * diff(r)
  c(r[1] - pad, r[2] + pad)
}

vline_irr <- function() {
  abline(
    v = params_irradiation$irr_start,
    lty = 2,
    lwd = 2.5,
    col = "grey40"
  )
}

legend_topright <- function(
  legend,
  col,
  lty,
  lwd,
  ncol = 1
) {

  legend(
    "topright",
    inset = c(0.02, 0.03),
    bty = "n",
    legend = legend,
    col = col,
    lty = lty,
    lwd = lwd,
    cex = 0.95,
    ncol = ncol
  )
}

ylim_cyto <- safe_ylim_group(
  out_irradiation$DC,
  out_irradiation$MC
)

ylim_crown <- c(0, 1400)

ylim_MN <- safe_ylim_group(
  out_irradiation$MN
)

ylim_A <- safe_ylim_group(
  out_irradiation$A,
  A_star
)

ylim_stress <- safe_ylim_group(
  out_irradiation$Irr,
  out_irradiation$s,
  params_irradiation$stress_const
)

# 1) CYTOPLASME

dev.new()
plot_par()

plot(
  out_irradiation$time,
  out_irradiation$DC,
  type = "l",
  col = "blue",
  lwd = 3,
  xlab = "TEMPS (H)",
  ylab = "CONCENTRATION",
  main = "CYTOPLASME",
  ylim = ylim_cyto
)

lines(
  out_irradiation$time,
  out_irradiation$MC,
  col = "darkgreen",
  lwd = 3
)

vline_irr()

legend_topright(
  legend = c(
    "D_C",
    "M_C",
    "DÉBUT IRRADIATION"
  ),
  col = c(
    "blue",
    "darkgreen",
    "grey40"
  ),
  lty = c(
    1,
    1,
    2
  ),
  lwd = c(
    3,
    3,
    2.5
  ),
  ncol = 1
)

# 2) COURONNE PÉRINUCLÉAIRE

dev.new()
plot_par()

plot(
  out_irradiation$time,
  out_irradiation$MA,
  type = "l",
  col = "purple",
  lwd = 3,
  xlab = "TEMPS (H)",
  ylab = "CONCENTRATION",
  main = "COURONNE PÉRINUCLÉAIRE",
  ylim = ylim_crown
)

lines(
  out_irradiation$time,
  out_irradiation$CA,
  col = "red",
  lwd = 3
)

lines(
  out_irradiation$time,
  out_irradiation$DA,
  col = "darkorange",
  lwd = 3
)

lines(
  out_irradiation$time,
  out_irradiation$PC,
  col = "green3",
  lwd = 3
)

vline_irr()

legend(
  "topleft",
  inset = c(0.02, 0.03),
  bty = "n",
  legend = c("M_A", "C_A", "D_A", "PC", "DÉBUT IRRADIATION"),
  col = c("purple", "red", "darkorange", "green3", "grey40"),
  lty = c(1, 1, 1, 1, 2),
  lwd = c(3, 3, 3, 3, 2.5),
  cex = 0.85,
  ncol = 2
)

# 3) NOYAU

dev.new()
plot_par()

plot(
  out_irradiation$time,
  out_irradiation$MN,
  type = "l",
  col = "red",
  lwd = 3,
  xlab = "TEMPS (H)",
  ylab = "CONCENTRATION",
  main = "NOYAU",
  ylim = ylim_MN
)

vline_irr()

legend_topright(
  legend = c(
    "M_N",
    "DÉBUT IRRADIATION"
  ),
  col = c(
    "red",
    "grey40"
  ),
  lty = c(
    1,
    2
  ),
  lwd = c(
    3,
    2.5
  ),
  ncol = 1
)

# 4) APOE LIBRE

dev.new()
plot_par()

plot(
  out_irradiation$time,
  out_irradiation$A,
  type = "l",
  col = "black",
  lwd = 3,
  xlab = "TEMPS (H)",
  ylab = "CONCENTRATION",
  main = "APOE LIBRE",
  ylim = ylim_A
)

vline_irr()

abline(
  h = A_star,
  lty = 3,
  lwd = 2.5,
  col = "grey40"
)

legend_topright(
  legend = c(
    "A",
    "DÉBUT IRRADIATION",
    "A*"
  ),
  col = c(
    "black",
    "grey40",
    "grey40"
  ),
  lty = c(
    1,
    2,
    3
  ),
  lwd = c(
    3,
    2.5,
    2.5
  ),
  ncol = 1
)

# 5) IRRADIATION ET STRESS TOTAL

dev.new()
plot_par()

plot(
  out_irradiation$time,
  out_irradiation$Irr,
  type = "l",
  col = "darkorange",
  lwd = 3,
  xlab = "TEMPS (H)",
  ylab = "CONCENTRATION",
  main = "IRRADIATION ET STRESS TOTAL",
  ylim = ylim_stress
)

lines(
  out_irradiation$time,
  out_irradiation$s,
  col = "black",
  lwd = 3
)

vline_irr()

abline(
  h = params_irradiation$stress_const,
  lty = 3,
  lwd = 2.5,
  col = "grey40"
)

legend_topright(
  legend = c(
    "IRR_N",
    "S",
    "DÉBUT IRRADIATION",
    "STRESS BASAL"
  ),
  col = c(
    "darkorange",
    "black",
    "grey40",
    "grey40"
  ),
  lty = c(
    1,
    1,
    2,
    3
  ),
  lwd = c(
    3,
    3,
    2.5,
    2.5
  ),
  ncol = 1
)