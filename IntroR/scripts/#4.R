# 1. if / else / loops
#   1.1 if
if(TRUE){
  print("sim")
}
if(FALSE){
  print("não")
}
if(class(1)=="numeric"){
  print("É numérico")
}
if(class(1)!="numeric"){
  print("Não é numérico")
}

#   1.2. else
52*32->A
10*60->B
if(A>B){
  print("A maior que B")
} else {
  print("A não é maior que B")
}
if(sum(abun[,74])==0){
  print("Nenhum individuo encontrado")
  abun<-abun[,-74]
}
arquivo<-""
if(file.exists(arquivo)){
  print("Arquivo existe")
} else {
  print("Arquivo não existe")
}

## Exercicio 1. Escreva um código que printe "É um número" se um objeto for númerico, e que printe "Não é um número" se o objeto não for numérico.
#objeto<-"1"
#if(class(objeto)=="numeric"){print("É um número")}else{print("Não é um número")}
#objeto<-1
#if(class(objeto)=="numeric"){print("É um número")}else{print("Não é um número")}

#   1.3. for loop
for(x in 1:10){
  print(x)
}
for(x in 1:10000){
  print(x)
}
for(y in seq(from=2,to=20,by=2)){
  print(y)
}
read.csv("datasets/Aranhas.csv")->spid
spid_occ<-spid[,1:(ncol(spid)-3)]
spid_amb<-spid[,(ncol(spid)-2):ncol(spid)]
dev.new()
par(mfrow=c(5,5))
for(x in 1:ncol(spid_occ)){
  plot(x = spid_amb$Dist, y = spid_occ[,x], xlab="Distância da borda", ylab = colnames(spid_occ)[x])
  abline(lm(spid_occ[,x]~spid_amb$Dist))
}
dev.off()
dev.new()
par(mfrow=c(5,5))
for(x in colnames(spid_occ)){
  plot(x = spid_amb$Dist, y = spid_occ[,x], xlab="Distância da borda", ylab = x)
  abline(lm(spid_occ[,x]~spid_amb$Dist))
}
dev.off()
sequn<-1:100
for(t in sequn){
  if(t==20){
    next
  }
  if(t==55){
    break
  }
  if(sum(t==seq(2,100,2))>=1){
    print(paste0(t," é um número par"))
  } else {
    print(paste0(t," é um número impar"))
  }
}

# Exercicio 2: Usando a planilha "abun.csv", faça um boxplot mostrando a diferença na abundância entre os 4 tratamentos da coluna "land_use" para cada uma das seguintes espécies: Hel_mar, Aeq_tet, Gym_gpa, Hem_bel, Bra_sp.2, Mic_wei, Hem_oce, Pir_bre, Nan_tri. Faça com que cada boxplot tenha mostre o nome da espécie no eixo y. Todos os boxplots precisam ter o mesmo nome no eixo x, "Uso de terra". Faça com que cada uso da terra tenha uma cor diferente. Utilize o loop for para plotar todos os boxplots de uma vez só e na mesma imagem (utilizando a função "par" para fazer uma grade de 3x3).
#read.csv(file = "datasets/abun.csv",header = TRUE,sep = ";",row.names = 1)->abun
#c("Hel_mar", "Aeq_tet", "Gym_gpa", "Hem_bel", "Bra_sp.2", "Mic_wei", "Hem_oce", "Pyr_bre", "Nan_tri")->sel_sp
#par(mfrow=c(3,3))
#for(spp in sel_sp){
#  boxplot(abun[,spp]~abun$land_use,ylab = paste0("Abundância de ",spp),xlab="Uso da terra",col=c("darkgreen","green","yellow","grey"))
#}

#   1.4. while loop
d=0
while(d<100){
  d=d+1
  print(paste0(d," é menor do que cem"))
  if(d>=90&d<=99){
    print(paste0(d," é perto de 100"))
  }
  if(d==100){
    print("Chegamos no 100")
  }
}
seque1<-1:500
n<-max(seque1)
while (n>1) {
  n<-sample(seque1,1)
  print(paste0("n é ",n))
}

# Exercicio: Escreva um while loop infinito.
#while(class(1)=="numeric"){
#  print("AAAA")
#}

#   1.5. repeat loop
repeat{
  print("Inf")
}
repeat{
  n<-sample(1:100,1)
  print(paste0("n é ",n))
  if(n==1){
    break
  }
}
# Exercício:Um pesquisador amostrou um riacho tributário do rio Guamá, na Amazônia, e mediu o tamanho do corpo de dez indivíduos de diferentes espécies de peixes, mas ele não sabe quais as espécies que foram medidas e lhe pergunta se você pode ajuda-lo a descobrir quais são essas espécies. Você pesquisa um pouco e descobre que naquele riacho ocorrem três espécies de peixe: Synbranchus marmoratus, Hemigrammus belottii e Erythrinus erythrinus. Ao ler a descrição das espécies, você se depara com a seguinte informação:
#"Synbranchus marmoratus é caracterizado pelo corpo em forma de serpente e tamanho mínimo de 100 centímetros, além da ausência de escamas e bexiga natatória. Já Hemigrammus belottii possui um corpo menor do que 5 centímetros coberto de escamas, se alimenta de artrópodes que caem da vegetação ao redor do riacho. Erythrinus erythrinus é um predador de topo de cadeia nos riachos Amazônicos, com um corpo que varia entre 15 e 40 centímetros. Apresentam poderosos e afiados dentes e seu corpo é coberto com grossas escamas cicloides e abundante camada de muco que protege contra parasitas externos. Apesar da grande variação de tamanho, indivíduos de E. erythrinus nunca atingem tamanhos menores do que 5 cm ou tamanhos maiores do que 100 cm."
#Após ler essa descrição, você percebe que as três espécies podem ser diferenciadas pelo tamanho do corpo e decide utilizar o R para lhe ajudar a diferenciar os dez indivíduos. Para isso, utilize os condicionais if e else para identificar quais indivíduos são de cada espécie. Dentro dos if e else, peça ao R que lhe retorne o nome da espécie (função print()) e coloque esse nome na terceira coluna da planilha "fish_size.csv", anexada à essa atividade. As medidas de tamanho do corpo para cada indivíduo estão na mesma planilha.
#read.csv("datasets/fish_size.csv")->size
#for(x in 1:nrow(size)){
#  if(size[x,2]>100){
#    print("Synbranchus marmoratus")
#    "Synbranchus marmoratus"->size[x,3]
#  } else {
#    if(size[x,2]<5){
#      print("Hemigrammus belottii")
#      "Hemigrammus belottii"->size[x,3]
#    } else {
#      print("Erythrinus erythrinus")
#      "Erythrinus erythrinus"->size[x,3]
#    }
#  }
#}
#size