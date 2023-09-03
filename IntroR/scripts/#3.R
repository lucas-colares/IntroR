# 1. Booleanos
#   1.2. TRUE/FALSE
TRUE
"TRUE"
FALSE
"FALSE"
T
F
class(T)
class(1)
class("T")
T+1
F+1
#   1.3. Teste de verdadeiro/falso
1>1
1>0.5
1>=1
1<2
1<1
1<=1
1==1
1==2
1<=2
"A"=="B"
"A"=="A"
A<-"A"
"A"==A
"B"==A
A!=3
"A"!="A"
"A"!=A
"A"!="B"

#### Exercício 1
# Crie um vetor com os valores 1, 2, ... 10. Veja quais valores são menores ou iguais a 5 utilizando o sinal < ou >. Salve o resultado em um novo objeto
#sequencia<-seq(1,10,1)
#verd_fal<-sequencia<=5
#sequencia[verd_fal]

# Quantos elementos do vetor são menores que 5?
sum(verd_fal)

# Combinando expressões
3>4|5>2
3>4&5>2
(7>5|5>6)&12<32
sequencia[sequencia>=3&sequencia<=7]
sequencia[sequencia>=3&sequencia<=7]<-1

# Exercicio 1. Carregue a planilha "fish_size.csv". Esta planilha contém dados de 10 individuos de peixes que pertencem a 3 gêneros diferentes, Hyphessobrycon, Hoplias e Synbrachus, porém, os gêneros não estão identificados na planilha. Considerando que o tamanho do corpo do Hyphessobrycon varia entre 1.5 à 5cm, Hoplias varia entre 17 e 30cm e Synbrachus varia entre 150 e 165cm, identifique quais individuos são de que espécie e inclua essa informação na coluna "sp" da planilha. 
#fish<-read.csv("datasets/fish_size.csv")
#Hyp<-fish$tamanho<=5
#Hop<-fish$tamanho>=17&fish$tamanho<=30
#Syn<-fish$tamanho>=150
#fish[Hyp,]$sp<-"Hyphessobrycon"
#fish[Hop,]$sp<-"Hoplias"
#fish[Syn,]$sp<-"Synbrachus"
#fish

# Transformando uma planilha de abun em occ
read.csv("datasets/abun.csv",header = TRUE,sep = ";",row.names = 1)->abun
abun<-abun[,-ncol(abun)]
abun[abun>1]<-1
abun

# Exercício 2: 
# 1. Importe a tabela Aranhas.csv
# Nesta tabela, cada local de amostragem está em uma linha
# 2. Separe a tabela em duas partes:
# 2.1 somente a parte com dados das espécies
# 2.2 somente a parte com dados ambientais (últimas 3 colunas)
# 3. Calcule o número de locais em que cada espécie ocorreu (colSums)
# 4. Selecione somente as espécies que ocorreram em ao menos 10 locais (espécies comuns).
# 5. Calcule a riqueza/número de espécies por local (rowSums).
# 6. Faça um gráfico da distância para a borda florestal vs. número de espécies
# 7. Compare este gráfico com o gráfico das espécies raras (faça também)
#read.csv("datasets/Aranhas.csv",sep=",")->spid
#spid_abun<-moth[,1:(ncol(moth)-3)]
#spid_amb<-moth[,(ncol(moth)-2):ncol(moth)]
#Nspp<-colSums(moth_abun)
#comuns<-spid_abun[,Nspp>=10]
#raras<-spid_abun[,Nspp<10]
#S_comuns<-rowSums(comuns)
#S_raras<-rowSums(raras)
#plot(spid_amb$Dist,S_comuns)
#plot(spid_amb$Dist,S_raras)

#   1.4. Expressões regulares
# grep, grepl, gsub
read.csv(file = "datasets/MothCommunities2013.csv",header = TRUE,sep = ";")->moth
Nocs<-grep(pattern = "Noctua",x = colnames(moth),ignore.case = T)
Nocs
head(moth[,Nocs])
Nocs2<-grepl(pattern = "Noctua",x = colnames(moth),ignore.case = T)
Nocs2
head(moth[,Nocs2])
SPP<-grepl(pattern = "sp",x = colnames(spid))
spid_abun<-spid[,SPP]
spid_amb<-spid[,!SPP]
SPP<-grep(pattern = "sp",x = colnames(spid))
spid_abun<-spid[,SPP]
spid_amb<-spid[,-SPP]
SPP2<-grepl(pattern = "Sp",x = colnames(spid)) #Erro de case
spid[,SPP2]
colnames(moth)
colnames(moth)<-gsub(pattern = "Parabagrotis",replacement = "Parabagrotes",x = colnames(moth))
colnames(moth)<-gsub(pattern = "\\.",replacement = " ",x = colnames(moth)) #Remove pontos

#Exercicio 4: 
# 1. Carregue a planilha "MothCommunities2013.csv" novamente e crie um objeto hamado "moth" para armazena-la. Esta planilha mostra a abundância de mariposas em 4 níveis diferentes de impacto humano, você pode checar quais os 4 níveis usando a função unique(moth$treatment).
# 2. Primeiro, na coluna treatment, usando a função gsub, substitua o número e o espaço que vem antes do nome do tratamento por nada. Alguns níveis da coluna "treatment" também tem um espaço no final, remova-os também.
# 3. Separe a planilha "moth" em 4 partes, uma para cada tratamento, usando a função grep ou grepl.
# 4. 
#read.csv(file = "datasets/MothCommunities2013.csv",header = TRUE,sep = ";")->moth
#gsub(pattern = "\\d ","",moth$treatment)->moth$treatment
#gsub(pattern = " ","",moth$treatment)->moth$treatment
#ctrl<-grepl("Control",moth$treatment)
#lights<-grepl("Light",moth$treatment)
#modr<-grepl("Moderate",moth$treatment)
#intens<-grepl("Intensive",moth$treatment)
#moth[ctrl,]->moth_ctrl
#moth[lights,]->moth_lights
#moth[modr,]->moth_modr
#moth[intens,]->moth_intens
#moth_ctrl$treatment
#moth_lights$treatment
#moth_modr$treatment
#moth_intens$treatment