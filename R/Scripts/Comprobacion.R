#Extracción de las gráficas de comprobación de la tabla de GRASS

#carga del archivo
puntos <- read.table("./Datos/tabla_puntos.csv", header=TRUE, sep=",")

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