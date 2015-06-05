## Lectura dos datos
puntos <- read.csv("puntos_comprob.csv")

## Posibilidade 1: gráfico de caixas para tódalas observacións en cada banda
boxplot(puntos[,4:8])

## Posibilidade 2: gráfico de barras para cada observación en cada banda
barplot(as.matrix(puntos[,4:8]), beside=TRUE)

## Posibilidade 3: liñas para cada observación
puntos2 <- t(puntos[,4:8])
matplot(1:5, puntos2, type="o")


## Posibilidade 4: liñas sobre boxplot

# A. Simulamos que os primeiros 9 puntos son medidos sobre a imaxe
puntos.imaxe <- puntos[1:9,4:8]/10000

# B. Supoñemos que o último punto corresponde a unha medición co espectrorradiómetro
punto.rad <- as.numeric(puntos[10,4:8]/10000)

# C. Montamos un gráfico onde se combinan ambas fontes de información
pdf("grafico.pdf")
boxplot(puntos.imaxe)
lines(1:5, punto.rad, col="red", type="o", lwd=2)
dev.off()
