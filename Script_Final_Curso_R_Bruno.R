#Curso de Introdu��o � visualiza��o de dados em R - PEC/UFAL - #18/08/2017

#Parte 2 - Introdu��o � bilioteca gr�fica ggplot2
#Autor: Bruno Carlos Vieira dos Santos #Contato: brunocarlos343@hotmail.com


# Ler a biblioteca
library(ggplot2)

# Escolhendo nossos dados (est�o dispon�veis nesse link, para isso utilizamos o argumento
#url dentro da fun��o read.table e declaremos header = TRUE, pois h� cabe�alho)

d <- read.table(url("http://assets.datacamp.com/blog_assets/chol.txt"), header = TRUE)

###Histograma

# Para fazer um histograma simples,
#utilizaremos a fun��o ggplot, nossos dados ser�o do data frame d, 
# mapearemos a vari�vel idade e utilizaremos a fun��o geom_hit()
# Para indicar que � um histograma 

hist <- ggplot(data=d, aes(d$AGE)) + geom_histogram()

#Visualiando o histograma

hist

# Alterando a cor, contorno, limites dos eixos, t�tulo e transpar�ncia

hist1 <-  ggplot(data=d, aes(d$AGE)) + 
  geom_histogram(breaks=seq(20, 50, by = 2), 
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histograma") +
  labs(x="Age", y="contador") + 
  xlim(c(18,52)) +  
  ylim(c(0,30))
# S�o atalhos, esses tamb�m poderiam ser alterados utilizando
# O comando scale_x ou scale_y para mudar os eixos e ggtitle para o t�tulo

#Adicionando a linha de densidade

hist1 <- ggplot(data=d, aes(d$AGE)) + 
  geom_histogram(aes(y =..density..), 
                 breaks=seq(20, 50, by = 2), 
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  geom_density(col=2) + # inser��o do comando geom_density
  
  # � importante ressaltar que geom_density e geom_histogram se sobrep�e
  # para resguardar as caracter�sticas do histograma, chame a fun��o aes()
  # dentro do geom_histogram()
  
  labs(title="Histograma") +
  labs(x="Age", y="Count")

# Visualizando os resultados

hist1

#Ler conjuntos de dados
library(datasets) 

#Visualizar o conjunto de dados
airquality

### Boxplot

# Transformar o vetor coluna M�s da Matriz airquality em uma vari�vel do tipo factor com os nomes dos
#meses de acordo com o n�mero  ex: mes 1 --> Janeiro
airquality$Month <- factor(airquality$Month,
                           labels = c("May", "Jun", "Jul", "Aug", "Sep"))

# Criando o boxplot mais simples 

p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot() # especifica que � um gr�fico de boxplot, H� v�rias outras alternativas, como por
#exemplo: geom_bar() para gr�fico de barra, geom_line() para gr�fico de linha

#visualizando o boxplot
p10


# Customizando os eixos:

# Para customizar os eixos, existem diversos par�metros como a cor do texto, a fonte, o tamanho.
# Vamos somente mudar por enquanto o nome dos eixos. Para isso utilizamos o comando scale_x para
# alteramos o eixo x e scale_y para alterarmos o eixo y.

p10 <- p10 + scale_x_discrete(name = "M�s") + # Altera o titulo do eixo x, sendo que esta fun��o pode 
  # receber outros par�metros tamb�m.
  
  scale_y_continuous(name = "M�dia de Oz�nio em Partes por bilh�o") # Altera o t�tulo do eixo y,
#sendo que esta fun��o pode  receber outros par�metros tamb�m

# visualizando as mudan�as...
p10


# Agora precisamos adicionar um t�tulo ao nosso gr�fico
# para isso utilizamos a fun��o ggtitle()

p10 <- p10 + ggtitle("Boxplot da m�dia mensal de oz�nio")

#visualizando o resultado
p10


#Alterando o plano de fundo

#para alterarmos o plano de fundo, utilizamos  a seguinte fun��o

p10 <- p10 + theme_bw() #H� varias fun��es theme_ (pesquisar)

#visualizando os resultados
p10


#Alterando a cor do boxplot

p10 <- p10 + geom_boxplot(fill = "blue", colour = "black") # Lembre-se que fill se refere ao preenchimento
# e colour se refere ao contorno da forma

#visualiando os resultados
p10

# podemos tamb�m alterar os limites dos gr�ficos nos eixos x e y
p10 <- p10 + scale_y_continuous(breaks  = seq(0,175, 25)) # O comando breaks � usado para particionar o  eixo

# do jeito que a� est�, o eixo ser� particionado de 25 em 25 de 0 at� 175
p10


# Esse � um exemplo simples, h� v�rios outros argumentos que podem ser alterados
# e adicionados para cria��o do gr�fico, o importante � fixar os conceitos e a gram�tica dos gr�ficos,
# isto �, o processo de cria��o dos gr�ficos.