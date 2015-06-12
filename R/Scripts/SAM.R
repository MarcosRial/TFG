## Script para aplicar o Spectral Angle Mapper a unha imaxe (borrador)
## Eduardo Corbelle, 10 xuño 2015

library(rgdal)
library(raster)

## Datos de exemplo (a substituír pola imaxe de interese)
b1 <- raster("/home/marcos/TrabajoFinGrado/GRASS/Imagenes_exportadas/L8GF_B1.TIFF")
b2 <- raster("/home/marcos/TrabajoFinGrado/GRASS/Imagenes_exportadas/L8GF_B2.TIFF")
b3 <- raster("/home/marcos/TrabajoFinGrado/GRASS/Imagenes_exportadas/L8GF_B3.TIFF")
b4 <- raster("/home/marcos/TrabajoFinGrado/GRASS/Imagenes_exportadas/L8GF_B4.TIFF")
b5 <- raster("/home/marcos/TrabajoFinGrado/GRASS/Imagenes_exportadas/L8GF_B5.TIFF")
b6 <- raster("/home/marcos/TrabajoFinGrado/GRASS/Imagenes_exportadas/L8GF_B6.TIFF")
b7 <- raster("/home/marcos/TrabajoFinGrado/GRASS/Imagenes_exportadas/L8GF_B7.TIFF")

# Agrupamos nun stack
imaxe  <- stack(b1,b2,b3,b4,b5,b6,b7)
# Recortamos a extensión (para facer probas)
imaxerec <- crop(imaxe, c(500000, 550000, 1400000, 1450000))


## Función para calcular o SAM 
SAM <- function(imaxe) {
  ref = c(0.02014679,0.02581965,0.04384647,0.03587113,0.2008885,0.1158728,0.05909439)  # A substituír polos valores medios de reflectividade en cada banda
  sam = acos(sum(ref*imaxe)/(sqrt(sum(ref^2))*sqrt(sum(imaxe^2))))
  return(sam)
}

## Aplicamos a función: 
imaxe2 <- calc(imaxe, SAM)
# Podemos exportala con (p.ex.):
writeRaster(imaxe2, "./Graficos/SAM.TIFF")

## Xerar imaxe de exemplo
png(filename="./Graficos/SAM.png",
    width = 25, height = 25, units = "cm",
    res=300
    )
plot(imaxe2, 1412100:1501230)
dev.off()
