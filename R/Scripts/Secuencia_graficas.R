# Secuencia de gráficas para beamer

plot (Rhizophora$V5~Rhizophora$V4,
      type = "l", col = "red",
      main = "Reflectividad",
      sub = NULL,
      lty = 1, lwd = 1,
      xlab = expression (paste (lambda, " (nm)")),
      ylab = expression (rho),
      xlim = c(350,1050), ylim = c(0,1.1))

abline (h = seq(0,1,0.2),
        lty=1, col="grey")

lines(Laguncularia$V5~Laguncularia$V4,
      type = "l", col = "green",
      #main = "Reflectividad",
      sub = NULL,
      lty = 2, lwd = 1,
      xlab = expression (paste (lambda, " (nm)")),
      ylab = expression (rho),
      xlim = c(350,1050), ylim = c(0,1.1))

lines(Avicennia$V5~Avicennia$V4,
      type = "l", col = "blue",
      #main = "Reflectividad",
      sub = NULL,
      lty = 3, lwd = 1,
      xlab = expression (paste (lambda, " (nm)")),
      ylab = expression (rho),
      xlim = c(350,1050), ylim = c(0,1.1))

legend (x = 750, y = 0.5,
        legend=c("R. mangle", 
                 "L. racemosa", 
                 "A. germinans"), 
        lty=c(1,2,3),
        col=c("red",
              "green",
              "blue"), 
        bty="n")

## Aplicado corte
plot(RhizophoraCorte$V5~RhizophoraCorte$V4,
     type = "l", col = "red",
     main = "Reflectividad",
     sub = NULL,
     lty = 1, lwd = 1,
     xlab = expression (paste (lambda, " (nm)")),
     ylab = expression (rho),
     xlim = c(400,950), ylim = c(0,1.1))

abline (h = seq(0,1,0.2),
        lty=1, col="grey")

lines(LagunculariaCorte$V5~LagunculariaCorte$V4,
      type = "l", col = "green",
      #main = "Reflectividad",
      sub = NULL,
      lty = 2, lwd = 1,
      xlab = expression (paste (lambda, " (nm)")),
      ylab = expression (rho),
      xlim = c(400,950), ylim = c(0,1.1))

lines(AvicenniaCorte$V5~AvicenniaCorte$V4,
      type = "l", col = "blue",
      #main = "Reflectividad",
      sub = NULL,
      lty = 3, lwd = 1,
      xlab = expression (paste (lambda, " (nm)")),
      ylab = expression (rho),
      xlim = c(400,950), ylim = c(0,1.1))
      
legend (x = 750, y = 0.5,
        legend=c("R. mangle", 
                 "L. racemosa", 
                 "A. germinans"),
        lty=c(1,2,3),
        col=c("red",
              "green",
              "blue"),
        bty = "n")

abline (v = c("430","450","510","530","590","640","670","850","880"),
        lty=1, col="grey")

text(440,0.9, "C",
     cex = 0.8)
text(480,0.9, "B",
     cex = 0.8)
text(560,0.9, "G",
     cex = 0.8)
text(655,0.9, "R",
     cex = 0.8)
text(865,0.9, "IRC",
     cex = 0.8)

## Esto creará un archivo png en la carpeta Gráficas
png (filename = "./Graficos/6.png",
     width = 15, height = 9, units = "cm", res = 300)

dev.off()
