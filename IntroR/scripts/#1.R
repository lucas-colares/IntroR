# 1. Apresentar interface.
#   1.1. File > New File > R Script
#   1.2. File > New Project
#   1.3. Tools > Global Options > Apperance
#   1.4. Tools > Global Options > Code > Soft-wrap
#   1.5. Session > Restart R
#   1.6. Session > Set Working Directory (Ctrl+Shift+H)

# 2. Meu primeiro script
#   2.1. Como fazer anotações usando o hashtag
#   2.2. Como fazer cabeçalhos usando # e -
#   2.3. Operações básicas + - / * ^ 
2+2
3*7
24/2
30-2
2^2
(5+5)*2
(7-2)/2.5
#   2.4. Criando objetos
lucas<-2+3-6
lucas # Mostrar objeto
#   2.5. Erros básicos
1+sdf
1/0
Lucas
#   2.6. Operações com objetos
1+lucas
#   2.7. Diversos nomes de objetos
soma_aqui<-3+3
SomaAqui<-3+3
soma.aqui<-3+3
soma_aqui+SomaAqui+SomaAqui

# 3. Criando vetores
#   3.1. Concatenar, sequência e repetições
c(2,5,8,12)
conc<-c(2,5,8,12)
seq(from=1,to=5,by=1)
?seq
sequencia<-seq(from=1,to=5,by=1)
sequencia2<-seq(from=1,to=5,length.out = 100)
1:10
sequencia3<-1:10
rep(x=2,times=5)
?rep
replica1<-rep(x=2,times=5)

#   3.2. Operações com vetores
conc
conc+5
conc*2
sequencia+10
sequencia-10
sequencia/2
sequencia3+20
sequencia3^2
sequencia3-2
replica1+20
replica1^10
replica1/2
sequencia/replica1
sum(sequencia)
sum(replica1)
mean(sequencia)
mean(sequencia3)
median(sequencia3)
median(sequencia)
sd(sequencia)
sd(sequencia3)
range(sequencia3)
range(replica1)

### Exercicio 1
# Vamos imaginar que nós temos a abundância de uma espécie mensurada em vários locais. Os valores de abundância foram os seguintes:
# 3 - 2 - 10 - 20 - 5

# Qual a abundância total de aves observada?
# Qual é a abundância média de um local?

#   3.3. Vetores com texto
conc2<-c("a","b","c","d")
replica2<-rep(x="a",times=5)
replica3<-rep(x="lucas",times=5)
con2_fac<-factor(conc2)
levels(con2_fac)
table(con2_fac)
replica3_fac<-factor(replica3)
levels(replica3_fac)
table(replica3_fac)

#   3.4. Diferenças entre texto e objetos
a
"a"
lucas
"lucas"
