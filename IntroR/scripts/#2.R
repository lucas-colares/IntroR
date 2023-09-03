# 1. Matrizes
#   1.1 Importando tabelas: Abrir excel e mostrar como salvar uma planilha em excel
read.csv(file = "datasets/abun.csv",header = TRUE,sep = ";",row.names = 1)->abun
abun
read.table(file = "datasets/abun.csv",header = TRUE,sep = ";",row.names = 1)->abun
abun
read.table(file = "datasets/abun.txt",header = TRUE,row.names = 1)->abun
abun
read.table(file = file.choose(),header = TRUE,sep = ";",row.names = 1)->abun
abun
read.table(file = 'clipboard',header = TRUE,row.names = 1)->abun
abun
head(abun)

#   1.2. Pegando partes de tabela ou vetor []
seq(from=1,to=50,by=1)->vect
vect[1]
vect[-1]
vect[25]
vect[50]
vect[1:10]
vect[c(1,3,5,7,8)]
vect[length(vect)]
vect[length(vect)-10]
abun[1,]
abun[,1]
abun[,"land_use"]
abun$land_use
abun[,"Api_reg"]
abun$Api_aga

# Exercício 1: Qual a média de abundância da espécie "Pyr_bre"?
# mean(abun[,"Pyr_bre"])

nrow(abun)
ncol(abun)
abun[nrow(abun),]
abun[,ncol(abun)]
abun[,-ncol(abun)]
abun[1:10,]
abun[,1:10]
abun[c(5,8,9,12),]
abun[,c(20,21,22,37,ncol(abun))]
abun[,c(20,21,22,37,ncol(abun))]->sub
sub[,1:4]*5->sub[,1:4]
sub[20,3]
sub[20,3]<-0
sub[20,3]
sum(abun[,1:10])

# Exercício 2: Calcule a abundância total coletada na campanha de campo.
# sum(abun[,-ncol(abun)])

# 2. Plotando gráficos
sp1<-abun[,"Pyr_bre"]
sp2<-abun[,"Api_reg"]

plot(x = sp1,y = sp2)
plot(x = sp1,y = sp2,xlab = "Abundância de Pyrrhulina brevis")
plot(x = sp1,y = sp2,xlab = "Abundância de Pyrrhulina brevis",ylab = "Abundância de Apistogramma regani")
windowsFonts()
par(family = "serif")
plot(x = sp1,y = sp2,
     xlab = "Abundância de Pyrrhulina brevis",
     ylab = "Abundância de Apistogramma regani",
     pch=19,col="red")
plot(x = sp1,y = sp2,
     xlab = substitute(paste("Abundância de ",italic("Pyrrhulina brevis"))),
     ylab = substitute(paste("Abundância de ",italic("Apistogramma regani"))),
     pch=19,col="red")
abline(lm(sp1~sp2))

boxplot(sp1~abun[,"land_use"]) # y~x
boxplot(sp1~abun[,"land_use"],
        xlab = "Categorias de uso de solo",
        ylab = "Abundância de Pyrrhulina brevis")
boxplot(sp1~abun[,"land_use"],
        xlab = substitute(bold("Categorias de uso de solo")),
        ylab = substitute(bold(paste("Abundância de ",bolditalic(" Pyrrhulina brevis")))),
        names=c("Floresta","Extração de madeira","Palma","Pasto"),
        col=c("darkgreen","lightgreen","yellow","grey"))
boxplot(sp1~abun[,"land_use"],
        xlab = substitute(bold("Categorias de uso de solo")),
        ylab = substitute(bold(paste("Abundância de ",bolditalic(" Pyrrhulina brevis")))),
        names=c("Floresta","Extração de madeira","Palma","Pasto"),
        col=c("darkgreen","lightgreen","yellow","grey"))
jpeg(filename = "plot1.jpg",width = 8,height = 6,units = "in",res = 600)
par(family = "serif")
boxplot(sp1~abun[,"land_use"],
        xlab = substitute(bold("Categorias de uso de solo")),
        ylab = substitute(bold(paste("Abundância de ",bolditalic(" Pyrrhulina brevis")))),
        names=c("Floresta","Extração de madeira","Palma","Pasto"),
        col=c("darkgreen","lightgreen","yellow","grey"),
        cex.lab=1.2, cex.axis=1.1)
dev.off()

par(mfrow=c(1,2))
plot(x = sp1,y = sp2,
     xlab = substitute(paste("Abundância de ",italic("Pyrrhulina brevis"))),
     ylab = substitute(paste("Abundância de ",italic("Apistogramma regani"))),
     pch=19,col="red")
abline(lm(sp1~sp2))
boxplot(sp1~abun[,"land_use"],
        xlab = substitute(bold("Categorias de uso de solo")),
        ylab = substitute(bold(paste("Abundância de ",bolditalic(" Pyrrhulina brevis")))),
        names=c("Floresta","Extração de madeira","Palma","Pasto"),
        col=c("darkgreen","lightgreen","yellow","grey"))

# Exercicio 3: Faça um boxplot mostrando como a espécie "Rin_has" muda entre os 4 tratamentos
#boxplot(abun$Rin_has~abun[,"land_use"]) # y~x

# 3. Funções úteis
abun_sem_cat<-abun[,-ncol(abun)]
rowSums(abun_sem_cat)
colSums(abun_sem_cat)
rowMeans(abun_sem_cat)
colMeans(abun_sem_cat)
# Usando apply para replicar
apply(abun_sem_cat,1,sum) # 2 significa segunda dimensão = coluna / rowSums
apply(abun_sem_cat,2,sum) # colSums
apply(abun_sem_cat,1,mean) # rowMeans
apply(abun_sem_cat,2,mean) # colMeans
apply(abun_sem_cat,2,sd)
apply(abun_sem_cat,2,max)
apply(abun_sem_cat,1,min)
apply(abun_sem_cat,2,range)

# Exercicio 4: Faça um boxplot mostrando com a abundância total de cada amostra muda entre os 4 tratamentos.
#abun_tot<-rowSums(abun_sem_cat)
#boxplot(abun_tot~abun$land_use)
