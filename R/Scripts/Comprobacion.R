#Extracción de las gráficas de comprobación de la tabla de GRASS

#carga del archivo
puntos <- read.csv("./Datos//puntos_comprob.csv")

#Gráfica para un punto 1
punto <- function(n){
plot(1:5, c(puntos2[n,4:8]),
     type = "o",
     col = "red",
     xlab = "Bandas Landsat",
     ylab = expression (rho),
     ylim = c(0,4000)
     )
abline (h = seq(0,4000,1000),
        lty=1, col="grey")
#legend(x = 2, y = 2000, legend = c("punto ", n), bty="n")
}

#Gráfica para los datos 2
puntost <- t(puntos[1:5,4:8])
matplot(1:5, puntost,
        type = "o",
        sub = NULL,
        xlab = "Bandas",
        ylab = expression (rho))
legend(x = 1, y = 0.32, 
       legend = c("punto 1", "punto 2", "punto 3", "punto 4", "punto 5"),
       col = c(1:5),
       lty = c(1:5))

puntost2 <- t(puntos[6:10,4:8])
matplot(1:5, puntost2,
        type = "l",
        sub = NULL,
        xlab = "Bandas",
        ylab = expression (rho))
legend(x = 1, y = 0.46, 
       legend = c("punto 6", "punto 7", "punto 8", "punto 9", "punto 10"),
       col = c(1:5),
       lty = c(1:5))

#Gráfica para los datos 3
png (filename = "./Graficos/grafica_comprob.png",
     width = 15, height = 15, units = "cm", res = 400,)

boxplot(puntos[,4:8], ylim = c(0,0.40))

abline (h = seq(0,1,0.1), 
        v = (1:5),
        lty=1, col="grey")

lines(1:5, RMmedias, col = "red", type = "o", lty = 1, lwd = 1)
lines(1:5, LRmedias, col = "green", type = "o", lty = 2, lwd = 1)
lines(1:5, AGmedias, col = "blue", type = "o", lty = 3, lwd = 1)

legend (x = 0.5, y = 0.40,
        legend=c("R. mangle", "L. racemosa", "A. germinans"), lty=c(1,2,3),
        col=c("red","green","blue"),
        #bty="n"
        )

dev.off()

#extracción de los datos de interés
Pericos <- c(puntos[1,]$B1, puntos[1,]$B2, puntos[1,]$B3, puntos[1,]$B4, puntos[1,]$B5)
Elotes <- c(puntos[2,]$B1, puntos[2,]$B2, puntos[2,]$B3, puntos[2,]$B4, puntos[2,]$B5)
Corinto1 <- c(puntos[3,]$B1, puntos[3,]$B2, puntos[3,]$B3, puntos[3,]$B4, puntos[3,]$B5)
Corinto2 <- c(puntos[4,]$B1, puntos[4,]$B2, puntos[4,]$B3, puntos[4,]$B4, puntos[4,]$B5)
Jiote <- c(puntos[5,]$B1, puntos[5,]$B2, puntos[5,]$B3, puntos[5,]$B4, puntos[5,]$B5)
Ganchos <- c(puntos[6,]$B1, puntos[6,]$B2, puntos[6,]$B3, puntos[6,]$B4, puntos[6,]$B5)
Brea <- c(puntos[7,]$B1, puntos[7,]$B2, puntos[7,]$B3, puntos[7,]$B4, puntos[7,]$B5)

#impresión de gráficas
barplot(Pericos, main="Pericos",
        col="blue",
        ylim=c(0,0.3), 
        names.arg = c("1","2","3","4","5"),
        xlab="Banda",
        ylab="Reflectividad",
        )

#todos en una tabla
datos <- structure(list(Pericos = c(puntos[1,]$B1, puntos[1,]$B2, puntos[1,]$B3, puntos[1,]$B4, puntos[1,]$B5),
                        Elotes = c(puntos[2,]$B1, puntos[2,]$B2, puntos[2,]$B3, puntos[2,]$B4, puntos[2,]$B5),
                        Corinto1 = c(puntos[3,]$B1, puntos[3,]$B2, puntos[3,]$B3, puntos[3,]$B4, puntos[3,]$B5),
                        Corinto2 = c(puntos[4,]$B1, puntos[4,]$B2, puntos[4,]$B3, puntos[4,]$B4, puntos[4,]$B5),
                        Grande = c(puntos[5,]$B1, puntos[5,]$B2, puntos[5,]$B3, puntos[5,]$B4, puntos[5,]$B5),
                        Ganchos = c(puntos[6,]$B1, puntos[6,]$B2, puntos[6,]$B3, puntos[6,]$B4, puntos[6,]$B5),
                        Brea = c(puntos[7,]$B1, puntos[7,]$B2, puntos[7,]$B3, puntos[7,]$B4, puntos[7,]$B5)
                        ),
                   .Names = c("Pericos","Elotes","Corinto 1","Corinto 2","Grande","Ganchos","Brea"),
                   class = "data.frame",
                   row.names = c(NA, -5L)
                   )

barplot(as.matrix(datos),
        main="Prueba",
        beside=TRUE,
        col = c("red","green","blue","yellow","brown"),
        xlab="Zona"
)


#otra forma
datos <- structure(list(B1 = c(puntos[1,]$B1, puntos[2,]$B1, puntos[3,]$B1, puntos[4,]$B1, puntos[5,]$B1, puntos[6,]$B1, puntos[7,]$B1),
                        B2 = c(puntos[1,]$B2, puntos[2,]$B2, puntos[3,]$B2, puntos[4,]$B2, puntos[5,]$B2, puntos[6,]$B2, puntos[7,]$B2),
                        B3 = c(puntos[1,]$B3, puntos[2,]$B3, puntos[3,]$B3, puntos[4,]$B3, puntos[5,]$B3, puntos[6,]$B3, puntos[7,]$B3),
                        B4 = c(puntos[1,]$B4, puntos[2,]$B4, puntos[3,]$B4, puntos[4,]$B4, puntos[5,]$B4, puntos[6,]$B4, puntos[7,]$B4),
                        B5 = c(puntos[1,]$B5, puntos[2,]$B5, puntos[3,]$B5, puntos[4,]$B5, puntos[5,]$B5, puntos[6,]$B5, puntos[7,]$B5)
                        ),
                  .Names = c("B1","B2","B3","B4","B5"),
                  class = "data.frame",
                  row.names = c(NA, -7L)
                  )