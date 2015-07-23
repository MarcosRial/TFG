## Índice de acuerdo espectral
## Siendo i y j las tablas con los datos
IAE <- function(i, j) {
  
  mediai = mean(i$V5) #media de las observaciones de reflectividad
  CBi = sapply(i$V5, FUN=function(x) {if(x>=mediai) {1} else {0}}) #creación de la codificación binaria
  
  mediaj = mean(j$V5)
  CBj = sapply(j$V5, FUN=function(x) {if(x>=mediaj) {1} else {0}})
  
  Indice = sum((CBi-CBj)^2)/length(CBi) #aplicación del índice
  
  plot (CBi~i$V4,
        type = "h", col = "grey",          ## tipo de línea y color
        ##main = "Índice de Acuerdo Espectral",                      ## título
        sub = NULL,                                  ## subtítulo
        lty = 1, lwd = 1,                            ## tipo y grosor de línea
        xlab = expression (paste (lambda, " (nm)")), ## etiquetado de los ejes
        ylab = "CB",
        xlim = c(420,900), ylim = c(0,1)            ## límites de los ejes
  )
  return(Indice)
}


## Ángulo espectral

AE <- function(i,j) {
  
  Ri = i$V5 #valores de las observaciones
  Rj = j$V5

#calculo del angulo espectral para dos cubiertas
  Angulo = acos (sum(Ri*Rj)/(sqrt(sum(Ri^2))*sqrt(sum(Rj^2))))
  return(Angulo)
}


## Continuum removal

#Función con matriz de datos
#generación de la matriz de datos
matriz <- matrix(c(mangle1corte$V5,mangle2corte$V5,mangle3corte$V5),
                 byrow=TRUE,
                 nrow=3,
                 ncol=481)
#se especifica el número de observaciones
bandas <- mangle1corte$V4
#se aplica la función
cr2 <- continuumRemoval(matriz, bandas)
#salida gráfica a los datos
matplot(bandas, t(matriz),
        col=c("grey","grey","grey"),
        type="l",
        xlab = expression (paste (lambda, " (nm)")),
        ylab = " ",
        ylim=c(0,1))
matlines(bandas, t(cr2),
         col=c("red","green","blue"))

legend (x = 750, y = 0.5,
        legend=c("Rhizophora", "Laguncularia", "Avicennia"),
        lty=c(1,2,3),
        col=c("red","green","blue"),
        bty="n")
#continúa en script GraficaCR.R

#Función original CR
require(prospectr) #carga el paquete necesario
#aplicación de la función implementada en prospectr
cr <- continuumRemoval(data1$V5, data1$V4,
                       type="R",
                       interpol="linear")
grafica(data1) #salida gráfica a los datos
lines(data1$V4,cr) #superposición de la gráfica de CR

#Función con máximo manual
require(prospectr)

cr1 <- continuumRemoval(data1$V5[1:134], data1$V4[1:134], type="R")
cr2 <- continuumRemoval(data1$V5[135:481], data1$V4[135:481],type="R")