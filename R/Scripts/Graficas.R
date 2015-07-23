## Se crea la gráfica, etiquetada para las bandas de Landsat 8
## x debe ser la tabla en la que tenemos los datos para la gráfica
grafica <- function(x) {
plot (x$V5~x$V4,                                   ## selección de x e y 
      type = "l", col = colores3,          ## tipo de línea y color
      #main = "Reflectividad",                      ## título
      sub = NULL,                                  ## subtítulo
      lty = c(1:3), lwd = 1,                            ## tipo y grosor de línea
      xlab = expression (paste (lambda, " (nm)")), ## etiquetado de los ejes
      ylab = expression (rho),
      xlim = c(400,950), ylim = c(0,1.1)            ## límites de los ejes
)
abline (h = seq(0,1,0.2),
  v = c("430","450","510","530","590","640","670","850","880"),   ## colocación de líneas de guía en los límites de bandas Landsat
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
}
## Para cargar más gráficas en la misma visualización.
grafica(RhizophoraCorte)
lines(LagunculariaCorte$V4,LagunculariaCorte$V5, type="l", col="green", lty=2,lwd=1)
lines(AvicenniaCorte$V4,AvicenniaCorte$V5, type="l", col="blue", lty=3,lwd=1)

legend (x = 750, y = 0.5,
        legend=c("R. mangle", "L. racemosa", "A. germinans"), lty=c(1,2,3),
        col=c("red","green","blue"), bty="n")

## Esto creará un archivo png en la carpeta Gráficas
png (filename = "./Graficos/gráficanueva.png",
     width = 15, height = 9, units = "cm", res = 300,)

grafica(x)             ## donde x es el archivo de datos
graficamas(y)          ## donde y es el archivo de datos a añadir
dev.off()