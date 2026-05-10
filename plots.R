# ============================================================
# PLOTS - MODELE RIANS
# ============================================================

par(
  mfrow = c(2,2),
  mar = c(5, 5, 4, 2),
  oma = c(0, 0, 1, 0),
  bg = "white"
)

# Couleurs stress
col_DC <- "#005AB5"
col_MC <- "#DC3220"
col_MA <- "#7B2CBF"
col_CA <- "#D00000"
col_DA <- "#F77F00"
col_PC <- "#00876C"
col_MN <- "#0077B6"
col_A  <- "#333333"

# Couleurs sans stress
col_DC_no <- "#7FB6E8"
col_MC_no <- "#F4A582"
col_PC_no <- "#8FD3C1"
col_MN_no <- "#9ECAE1"
col_A_no  <- "#BDBDBD"

add_grid <- function() {
  grid(col = "#DDDDDD", lty = 1, lwd = 0.8)
}

plot_theme <- function() {
  box(lwd = 1.2)
}

# ============================================================
# 1) CYTOPLASME
# ============================================================

ylim_cyto <- range(
  out_no_stress$DC, out_no_stress$MC,
  out_stress$DC, out_stress$MC
)

plot(
  out_no_stress$time, out_no_stress$DC,
  type = "l",
  col = col_DC_no,
  lwd = 2,
  lty = 3,
  xlab = "Temps (h)",
  ylab = "Concentration",
  main = "Cytoplasme : ATM",
  ylim = ylim_cyto,
  cex.lab = 1.15,
  cex.main = 1.25,
  cex.axis = 1
)

add_grid()

lines(out_no_stress$time, out_no_stress$MC, col = col_MC_no, lwd = 2, lty = 3)
lines(out_stress$time, out_stress$DC, col = col_DC, lwd = 4)
lines(out_stress$time, out_stress$MC, col = col_MC, lwd = 4)

plot_theme()

legend(
  "right",
  legend = c("D_C sans stress", "M_C sans stress", "D_C stress", "M_C stress"),
  col = c(col_DC_no, col_MC_no, col_DC, col_MC),
  lty = c(3, 3, 1, 1),
  lwd = c(2, 2, 4, 4),
  bty = "n",
  cex = 0.95
)

# ============================================================
# 2) REGION PERINUCLEAIRE / COURONNE
# ============================================================

ylim_crown <- range(
  out_no_stress$MA, out_no_stress$CA, out_no_stress$DA, out_no_stress$PC,
  out_stress$MA, out_stress$CA, out_stress$DA, out_stress$PC
)

plot(
  out_no_stress$time, out_no_stress$PC,
  type = "l",
  col = col_PC_no,
  lwd = 2,
  lty = 3,
  xlab = "Temps (h)",
  ylab = "Concentration",
  main = "Formation de la couronne",
  ylim = ylim_crown,
  cex.lab = 1.15,
  cex.main = 1.25,
  cex.axis = 1
)

add_grid()

lines(out_stress$time, out_stress$MA, col = col_MA, lwd = 4)
lines(out_stress$time, out_stress$CA, col = col_CA, lwd = 4)
lines(out_stress$time, out_stress$DA, col = col_DA, lwd = 4)
lines(out_stress$time, out_stress$PC, col = col_PC, lwd = 5)

plot_theme()

legend(
  "topleft",
  legend = c("PC sans stress", "M_A stress", "C_A stress", "D_A stress", "PC stress"),
  col = c(col_PC_no, col_MA, col_CA, col_DA, col_PC),
  lty = c(3, 1, 1, 1, 1),
  lwd = c(2, 4, 4, 4, 5),
  bty = "n",
  cex = 0.88
)

# ============================================================
# 3) NOYAU
# ============================================================

ylim_MN <- range(out_no_stress$MN, out_stress$MN)

plot(
  out_no_stress$time, out_no_stress$MN,
  type = "l",
  col = col_MN_no,
  lwd = 2,
  lty = 3,
  xlab = "Temps (h)",
  ylab = "Concentration",
  main = "ATM nucléaire",
  ylim = ylim_MN,
  cex.lab = 1.15,
  cex.main = 1.25,
  cex.axis = 1
)

add_grid()

lines(out_stress$time, out_stress$MN, col = col_MN, lwd = 4.5)

plot_theme()

legend(
  "topright",
  legend = c("M_N sans stress", "M_N stress"),
  col = c(col_MN_no, col_MN),
  lty = c(3, 1),
  lwd = c(2, 4.5),
  bty = "n",
  cex = 0.95
)

# ============================================================
# 4) APOE LIBRE
# ============================================================

ylim_A <- range(out_no_stress$A, out_stress$A)

plot(
  out_no_stress$time, out_no_stress$A,
  type = "l",
  col = col_A_no,
  lwd = 2,
  lty = 3,
  xlab = "Temps (h)",
  ylab = "Concentration",
  main = "ApoE libre",
  ylim = ylim_A,
  cex.lab = 1.15,
  cex.main = 1.25,
  cex.axis = 1
)

add_grid()

lines(out_stress$time, out_stress$A, col = col_A, lwd = 4.5)

plot_theme()

legend(
  "bottomleft",
  legend = c("A sans stress", "A stress"),
  col = c(col_A_no, col_A),
  lty = c(3, 1),
  lwd = c(2, 4.5),
  bty = "n",
  cex = 0.95
)