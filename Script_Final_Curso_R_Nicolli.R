#Curso de Introdução à visualização de dados em R - PEC/UFAL - #18/08/2017

#Parte 1 - Programação básica em Linguagem R 
#Autora: Nicolli Albuquerque #Contato: albuquerquenicolli@hotmail.com

#Para executar no console qualquer parte desse código
#Version
version

#Citation
citation() #R Core Team (2017). R: A language and environment for statistical computing. R Foundation
           #for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.

#Limpar tela (limpando o console, que é essa janela abaixo), use ctrl+l 

#Listar objetos e variáveis 
ls()

#Limpar memória
rm(list=ls()) 
#apaga os objetos e variáveis que estavam no nosso ambiente de trabalho
#dê um ls() de novo e confira!

#Pedindo ajuda 
?rm #para função específica
#(Perceba que essa janela do canto direito de baixo mudou)
??statistics #para uma palavra relacionada

#Instalando pacotes #swirl
install.packages("swirl") #ótimo para aprender R (:
library(swirl)  #permite que o R use o pacote, tem que "chamar" quando for usar

#Usando Ctrl+shift+c comentamos o código. Posicione o cursor nessa linha e teste! ;)

#R funciona como uma calculadora 
3+4 #Adição
7*2 #Multiplicação
5-9 #Subtração
8/2 #Divisão
4**3 #Potenciação
4^3 #Potenciação
9%%4 #Resto de uma divisão

#Atribuição de valor a uma variável 
# = ou <- (não faz diferença usar um ou outro,escolha!)
a<-1
a
a=2
a #veja que mudou o valor de "a", então deu certo!

#Tipos de dados 
#Numéricos #Lógicos #Caracteres(Strings)

#Qual o tipo de dado? 
a<-TRUE
class(a)

#Tipos de objetos no R
#Vetores #Matrizes #Fatores #Listas #Data Frame  

##1.Vetores
#Rede de restaurantes
#Imagine que você tenha uma rede de restaurantes e queira conferir como ficou o "balanço"
#de caixa em uma semana
caixa<-c(47,120,-40,200,30,-100,-300)
semana<-c("Domingo","Segunda","Terça","Quarta","Quinta","Sexta","Sábado")
names(caixa)<-semana #Nomeando os nomes dos elementos
length(caixa) #Tamanho do vetor
caixa

#Calculando o fluxo de caixa da semana para dois restaurantes da rede
caixa1<-caixa
caixa2<-c(42,-67,400,-70,30,58,-256) 
names(caixa2)<-semana
total2rest<-caixa1+caixa2
total2rest

#Balanço semanal por restaurante
rest1_semana<-sum(caixa1)
rest2_semana<-sum(caixa2)

#Total geral da semana
total_rede<-rest2_semana+rest1_semana

#Comparando os valores que estão dentro do objeto (eles retornam um valor lógico)
caixa1>caixa2
rest1_semana<=rest2_semana

#Acessando um valor #Índice e Nome da coluna
sabado1<-caixa1[7]
sabado1
sabado2<-caixa1["Sábado"]
sabado1

#Acessando vários valores 
#Por Índice
fds1<-caixa1[c(7,1)]
fds1
#Por Nome da coluna
fds2<-caixa1[c("Sábado","Domingo")]
fds2
#Por Intervalos de índices
uteis<-caixa1[2:6]
uteis

#Dias bons #dias onde os dois restaurantes lucraram
dias_bons<-total2rest>0 
dias<- total2rest[dias_bons]
dias

#2.Matrizes
#Criando uma matriz
m1<-matrix(3:11,nrow=3,ncol=3)
m2<-matrix(0.5:1:8.5,nrow=3,ncol=3)
m3<-matrix(1:6,byrow = TRUE,ncol=2)
m4<-matrix(1:6,byrow = TRUE,ncol=3)

#Verificando as dimensões 
dim(m3) #3 linhas e 2 colunas

#Criando uma matriz
#Criar 3 vetores com valores numéricos
celtics<-c(2.12,2.4,2.0,1.95)
lakers<-c(1.88,2.3,1.98,2.18)
bucks<-c(2.24,1.87,2.3,1.83)

#Juntar os três
basquete<-c(celtics,lakers,bucks)

#Criar a matriz
m_basquete<-matrix(basquete,byrow =FALSE,ncol=3)

#Renomear colunas e linhas
colnames(m_basquete)<-c("celtics","lakers","bucks")
m_basquete
rownames(m_basquete)<-c("T1","T2","T3","T4")
m_basquete

#Selecionando valores:
View(m_basquete) #dando uma olhada na matriz
#Elemento
m_basquete[1,2]
m_basquete["T1","lakers"]
#Coluna
m_basquete[,1]
m_basquete[,"bucks"]
#Linha
m_basquete["T1",]
#Subconjunto
m_basquete[c("T1","T3"),3]


#3.Fatores
rendimento<-c("alto","médio","alto","baixo","baixo")
f_rendimento<-factor(rendimento)

#Definir os níveis
f_rendimento<-factor(rendimento,ordered = TRUE,levels=c("baixo","médio","alto"))


#4.Listas
umvetor <- 1:10 
umamatriz<- matrix(1:9, ncol = 3)
umdataframe<- mtcars[1:10,]
lista_de_objetos<- list(umvetor,umamatriz,umdataframe)

#Nomeando cada objeto da lista
names(lista_de_objetos)<-c("um.a.10","um.a.nove","carros")

#Renomear cada um dos objetos dentro da lista
lista_de_objetos<- list(um_a_dez=umvetor,um_a_nove=umamatriz,meus_carros=umdataframe)
lista_de_objetos

#Selecionando elementos
lista_de_objetos[[3]]
lista_de_objetos$carros[2,]

#Adicionar objeto à lista
lista_de_objetos_nova<-c(lista_de_objetos,grupo="PEC - CTEC/UFAL")


#5.Data Frames
#Qual o diretório atual?
getwd()

#Definindo diretório de trabalho
setwd("C:/Users/albuq/Desktop")

#Importando arquivos
dados_titanic<-read.csv("https://goo.gl/4QpYvK",sep=",",header = TRUE) 
#Aqui você está adquirindo os dados diretamente da internet, mas você pode usar o 
#arquivo que foi enviado no e-mail. Para importá-lo, ele precisa estar no diretório 
#atual.Lembre-se que o nome do arquivo deve conter sua extensão; no nosso caso, 
#trabalhamos com csv. Usaríamos "titanic.csv" ao invés de "https://goo.gl/4QpYvK".

#Exportando arquivos
write.table(dados_titanic, file='titanic1.csv', sep=';', dec='.', row.names=FALSE)
#Lembrando que esse arquivo vai para o diretório atual

#Dando uma olhada em dados_titanic
head(dados_titanic)
str(dados_titanic)
View(dados_titanic)

#Ordenando dados
cidades_ord_alf<- dados_titanic[order(dados_titanic$embarked),] #ordenando strings: ficam em ordem alfabética
classes<- dados_titanic[order(dados_titanic$class),] #ordenando valores numéricos

#Alterar nome de uma coluna
names(dados_titanic)
colnames(dados_titanic)[7]<-"Tarifa"

#Excluindo linhas
nrow(dados_titanic)
dados_titanic_1 <- dados_titanic[-c(1,5), ]
nrow(dados_titanic_1)

#Explorando meus dados 
#Quantas pessoas eu tenho em cada classe?
table(dados_titanic$class)

#Quantas mulheres eu tenho na terceira classe?
mulheres_3<-subset(dados_titanic,(dados_titanic$who=="woman") & (dados_titanic$class=="Third"))
mulheres_3<-subset(dados_titanic,who=="woman" & class=="Third")
nrow(mulheres_3)

#Quantas crianças estão viajando sozinhas?
c_sozinhas<-subset(dados_titanic,who=="child" & alone=="True")
nrow(c_sozinhas)
View(c_sozinhas)

#Quantos maiores de idade eu tenho à bordo?
maiores_idade<-subset(dados_titanic,age>=18)
nrow(maiores_idade) #601

#Qual a idade máxima para um homem à bordo?
homens<-subset(dados_titanic,who=="man")
summary(homens$age)

#Quais são os dados para esse homem com a idade mínima?
homens<- subset(homens, !is.na(homens$age))
homem_idade_máxima<-subset(homens,homens$age==max(homens$age))

#Quantos maiores de idade eu tenho à bordo?
maiores_idade<-subset(dados_titanic,age>=18)
nrow(maiores_idade) #601

####Estatísticas
View(dados_titanic)
quantile(dados_titanic$Tarifa)
mean(dados_titanic$Tarifa)
sd(dados_titanic$Tarifa)
var(dados_titanic$Tarifa)
median(dados_titanic$Tarifa)
min(dados_titanic$Tarifa)
max(dados_titanic$Tarifa)
range(dados_titanic$Tarifa)
summary(dados_titanic)


#Estruturas 
#Estruturas de condição
#O número é par ou é ímpar?
n <- as.integer(readline(prompt="Digite um número: ")) #Entrada de dados 
if(n%%2==0){
  print("É par!")
  }else{
  print("É ímpar!")
  }
#Selecione tudo de if até o último colchete e dê um ctrl+r

#Estruturas de repetição
#n primeiros números naturais 
#Lembrando que o zero é o primeiro número natural
numero <- as.integer(readline(prompt="Digite um número: "))
for(i in 0:(numero-1)){
  print(i)
}
#Selecione tudo de for até o último colchete e dê um ctrl+r

###Lembra do problema que deu no "for", mostrando o primeiro número natural como -1?
#Escrevendo "for (i in 0:(numero-1))" ao invés de "for (i in 0:numero-1)" dá certo (:

