#Script para graficar datos en color azul
#Esta gráfica será guardada en un archivo tipo .png

graficaAG <- function(x) {
  plot (x$V5~x$V4,                                   ## selección de x e y 
        type = "l", col = "blue",                    ## tipo de línea y color
        #main = "Reflectividad",                      ## título
        sub = "Avicennia Germinans",                 ## subtítulo
        lty = 1, lwd = 1,                            ## tipo y grosor de línea
        xlab = expression (paste (lambda, " (nm)")), ## etiquetado de los ejes
        ylab = expression (rho),
        xlim = c(400,950), ylim = c(0,1.05)         ## límites de los ejes
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

png (filename = "./Graficos/AGcorte.png",
     width = 15, height = 9, units = "cm", res = 300,)
graficaAG(AvicenniaCorte)
dev.off()