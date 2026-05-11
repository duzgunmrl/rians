# PLOTS 

plot_par <- function() {
  par(
    mar = c(5, 4.5, 3, 1.2),
    mgp = c(2.7, 0.9, 0),
    xaxs = "i",
    bg = "white"
  )
}

# LIMITES DES AXES

ylim_cyto <- range(
  out_no_stress$DC, out_no_stress$MC,
  out_stress$DC, out_stress$MC
)

ylim_crown <- range(
  out_no_stress$MA, out_no_stress$CA, out_no_stress$DA, out_no_stress$PC,
  out_stress$MA, out_stress$CA, out_stress$DA, out_stress$PC
)

ylim_MN <- range(out_no_stress$MN, out_stress$MN)

ylim_A <- range(out_no_stress$A, out_stress$A, A_star)

# 1) CYTOPLASME

dev.new()
plot_par()

plot(out_no_stress$time, out_no_stress$DC,
     type = "l",
     col = "blue",
     lwd = 2.6,
     xlab = "TEMPS (H)",
     ylab = "CONCENTRATION",
     main = "Cytoplasme",
     ylim = ylim_cyto)

lines(out_no_stress$time, out_no_stress$MC,
      col = "darkgreen",
      lwd = 2.6)

lines(out_stress$time, out_stress$DC,
      col = "blue",
      lty = 2,
      lwd = 2.6)

lines(out_stress$time, out_stress$MC,
      col = "darkgreen",
      lty = 2,
      lwd = 2.6)

legend("topright",
       bty = "n",
       cex = 0.95,
       legend = c(
         "D_C sans stress",
         "M_C sans stress",
         "D_C stress",
         "M_C stress"
       ),
       col = c(
         "blue",
         "darkgreen",
         "blue",
         "darkgreen"
       ),
       lty = c(1,1,2,2),
       lwd = c(2.6,2.6,2.6,2.6))


# 2) COURONNE PERINUCLEAIRE

dev.new()
plot_par()

plot(out_no_stress$time, out_no_stress$MA,
     type = "l",
     col = "purple",
     lwd = 2.6,
     xlab = "TEMPS (H)",
     ylab = "CONCENTRATION",
     main = "Couronne périnucléaire",
     ylim = ylim_crown)

lines(out_no_stress$time, out_no_stress$CA,
      col = "red",
      lwd = 2.6)

lines(out_no_stress$time, out_no_stress$DA,
      col = "darkorange",
      lwd = 2.6)

lines(out_no_stress$time, out_no_stress$PC,
      col = "green3",
      lwd = 2.6)

lines(out_stress$time, out_stress$MA,
      col = "purple",
      lty = 2,
      lwd = 2.6)

lines(out_stress$time, out_stress$CA,
      col = "red",
      lty = 2,
      lwd = 2.6)

lines(out_stress$time, out_stress$DA,
      col = "darkorange",
      lty = 2,
      lwd = 2.6)

lines(out_stress$time, out_stress$PC,
      col = "green3",
      lty = 2,
      lwd = 2.6)

legend("topleft",
       bty = "n",
       cex = 0.88,
       legend = c(
         "M_A sans stress",
         "C_A sans stress",
         "D_A sans stress",
         "PC sans stress",
         "M_A stress",
         "C_A stress",
         "D_A stress",
         "PC stress"
       ),
       col = c(
         "purple","red","darkorange","green3",
         "purple","red","darkorange","green3"
       ),
       lty = c(1,1,1,1,2,2,2,2),
       lwd = rep(2.6, 8))

# 3) NOYAU

dev.new()
plot_par()

plot(out_no_stress$time, out_no_stress$MN,
     type = "l",
     col = "red",
     lwd = 2.6,
     xlab = "TEMPS (H)",
     ylab = "CONCENTRATION",
     main = "Noyau",
     ylim = ylim_MN)

lines(out_stress$time, out_stress$MN,
      col = "red",
      lty = 2,
      lwd = 2.6)

legend("topright",
       bty = "n",
       legend = c(
         "M_N sans stress",
         "M_N stress"
       ),
       col = c("red","red"),
       lty = c(1,2),
       lwd = c(2.6,2.6))


# 4) APOE LIBRE


dev.new()
plot_par()

plot(out_no_stress$time, out_no_stress$A,
     type = "l",
     col = "black",
     lwd = 2.6,
     xlab = "TEMPS (H)",
     ylab = "CONCENTRATION",
     main = "ApoE libre",
     ylim = ylim_A)

lines(out_stress$time, out_stress$A,
      col = "black",
      lty = 2,
      lwd = 2.6)

abline(h = A_star,
       lty = 3,
       col = "grey40",
       lwd = 2)

legend("topright",
       bty = "n",
       legend = c(
         "A sans stress",
         "A stress"
       ),
       col = c("black","black"),
       lty = c(1,2),
       lwd = c(2.6,2.6))