#Gráfica para hacer los CR conjuntos

graficaCR <- function(x) {
  plot (x$V5~x$V4,                                   ## selección de x e y 
        type = "n", col = "red",                     ## no se imprimirá ningun dato
        main = "Continuum Removal",                  ## título
        sub = NULL,                                  ## subtítulo
        lty = 1, lwd = 1,                            ## tipo y grosor de línea
        xlab = expression (paste (lambda, " (nm)")), ## etiquetado de los ejes
        ylab = "y",
        xlim = c(400,920), ylim = c(0,1.05)         ## límites de los ejes
  )
  abline (h = seq(0,1,0.2),
          v = seq(400,920,100),   ## colocación de líneas de guía en los límites de bandas Landsat
          lty=1, col="grey")
  legend (x = 750, y = 0.8,
          legend=c("Rhizophora", "Laguncularia", "Avicennia"), lty=c(1),
          col=c("red","green","blue"), bty="n")
}

graficaCR(Rhizophora)

lines(RhizophoraCorte$V4[1:134],crRM1, col = "red")
lines(RhizophoraCorte$V4[135:481],crRM2, col = "red")

lines(LagunculariaCorte$V4[1:131],crLR1, col = "green")
lines(LagunculariaCorte$V4[132:481],crLR2, col = "green")

lines(AvicenniaCorte$V4[1:131],crAG1, col = "blue")
lines(AvicenniaCorte$V4[132:481],crAG2, col = "blue")