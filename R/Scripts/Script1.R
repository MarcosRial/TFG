## Se lee el fichero de datos contenido en la carpeta Datos
data1 <- read.table("./Datos/11_04.dat")

## Simulamos una nueva curva
data2 <- data.frame(data1[,-5],
                    V5=data1$V5*abs(rnorm(751, mean=0, sd=.2)))

##creación de máximos relativos
cr1 <- continuumRemoval(data1$V5[1:134], data1$V4[1:134], type="R")
cr2 <- continuumRemoval(data1$V5[135:481], data1$V4[135:481], type="R")
cr1[232:751] <- continuumRemoval(data1$V5[232:751], data1$V4[232:751], type="R")

##Creación de máximos relativos

MAX<-sapply(data1$V5, FUN = function(x) {if (x-1<x>x+1) {max} else {0}}

max(seq(from=data1$V5[1],to=data1$V5[700], by=100))
            
##Medias para pasar los datos a valores Landsat

dataTM1<-data.frame(Rango=data1$V4[126:191],data1=data1$V5[126:191],data3=data3$V5[126:191],data4=data4$V5[126:191],data5=data5$V5[126:191])
dataTM2<-data.frame(Rango=data1$V4[201:281],data1=data1$V5[201:281],data3=data3$V5[201:281],data4=data4$V5[201:281],data5=data5$V5[201:281])
dataTM3<-data.frame(Rango=data1$V4[306:366],data1=data1$V5[306:366],data3=data3$V5[306:366],data4=data4$V5[306:366],data5=data5$V5[306:366])
dataTM4<-data.frame(Rango=data1$V4[456:576],data1=data1$V5[456:576],data3=data3$V5[456:576],data4=data4$V5[456:576],data5=data5$V5[456:576])

mediaTM1<-data.frame(Media=sapply(dataTM1,FUN=mean))
mediaTM2<-data.frame(Media=sapply(dataTM2,FUN=mean))
mediaTM3<-data.frame(Media=sapply(dataTM3,FUN=mean))
mediaTM4<-data.frame(Media=sapply(dataTM4,FUN=mean))

#############################################################################################
Landsat <- function (a,b,c,d) {  #función del anterior, pero no guarda las variables
  dataTM1<-data.frame(rango=a$V4[126:191],data1=a$V5[126:191],data3=b$V5[126:191],data4=c$V5[126:191],data5=d$V5[126:191])
  dataTM2<-data.frame(rango=a$V4[201:281],data1=a$V5[201:281],data3=b$V5[201:281],data4=c$V5[201:281],data5=d$V5[201:281])
  dataTM3<-data.frame(rango=a$V4[306:366],data1=a$V5[306:366],data3=b$V5[306:366],data4=c$V5[306:366],data5=d$V5[306:366])
  dataTM4<-data.frame(rango=a$V4[456:576],data1=a$V5[456:576],data3=b$V5[456:576],data4=c$V5[456:576],data5=d$V5[456:576])
  
  mediaTM1<-data.frame(media=sapply(dataTM1,FUN=mean))
  mediaTM2<-data.frame(media=sapply(dataTM2,FUN=mean))
  mediaTM3<-data.frame(media=sapply(dataTM3,FUN=mean))
  mediaTM4<-data.frame(media=sapply(dataTM4,FUN=mean))
}
#############################################################################################

Landsat2 <- function (a) {  #función del anterior, pero no guarda las variables
  TM1<-mean(a$V5[a$V4>=450 & a$V4<=515])
  TM2<-mean(a$V5[a$V4>=525 & a$V4<=605])
  TM3<-mean(a$V5[a$V4>=630 & a$V4<=690])
  TM4<-mean(a$V5[a$V4>=780 & a$V4<=900])

  return(c(TM1,TM2,TM3,TM4))
}
#############################################################################################