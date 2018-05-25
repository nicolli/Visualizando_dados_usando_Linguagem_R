#Curso de Introdução à visualização de dados em R - PEC/UFAL - #18/08/2017

#Parte 2 - Introdução à bilioteca gráfica ggplot2
#Autor: Bruno Carlos Vieira dos Santos #Contato: brunocarlos343@hotmail.com


# Ler a biblioteca
library(ggplot2)

# Escolhendo nossos dados (estão disponíveis nesse link, para isso utilizamos o argumento
#url dentro da função read.table e declaremos header = TRUE, pois há cabeçalho)

d <- read.table(url("http://assets.datacamp.com/blog_assets/chol.txt"), header = TRUE)

###Histograma

# Para fazer um histograma simples,
#utilizaremos a função ggplot, nossos dados serão do data frame d, 
# mapearemos a variável idade e utilizaremos a função geom_hit()
# Para indicar que é um histograma 

hist <- ggplot(data=d, aes(d$AGE)) + geom_histogram()

#Visualiando o histograma

hist

# Alterando a cor, contorno, limites dos eixos, título e transparência

hist1 <-  ggplot(data=d, aes(d$AGE)) + 
  geom_histogram(breaks=seq(20, 50, by = 2), 
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histograma") +
  labs(x="Age", y="contador") + 
  xlim(c(18,52)) +  
  ylim(c(0,30))
# São atalhos, esses também poderiam ser alterados utilizando
# O comando scale_x ou scale_y para mudar os eixos e ggtitle para o título

#Adicionando a linha de densidade

hist1 <- ggplot(data=d, aes(d$AGE)) + 
  geom_histogram(aes(y =..density..), 
                 breaks=seq(20, 50, by = 2), 
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  geom_density(col=2) + # inserção do comando geom_density
  
  # é importante ressaltar que geom_density e geom_histogram se sobrepõe
  # para resguardar as características do histograma, chame a função aes()
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

# Transformar o vetor coluna Mês da Matriz airquality em uma variável do tipo factor com os nomes dos
#meses de acordo com o número  ex: mes 1 --> Janeiro
airquality$Month <- factor(airquality$Month,
                           labels = c("May", "Jun", "Jul", "Aug", "Sep"))

# Criando o boxplot mais simples 

p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot() # especifica que é um gráfico de boxplot, Há várias outras alternativas, como por
#exemplo: geom_bar() para gráfico de barra, geom_line() para gráfico de linha

#visualizando o boxplot
p10


# Customizando os eixos:

# Para customizar os eixos, existem diversos parâmetros como a cor do texto, a fonte, o tamanho.
# Vamos somente mudar por enquanto o nome dos eixos. Para isso utilizamos o comando scale_x para
# alteramos o eixo x e scale_y para alterarmos o eixo y.

p10 <- p10 + scale_x_discrete(name = "Mês") + # Altera o titulo do eixo x, sendo que esta função pode 
  # receber outros parâmetros também.
  
  scale_y_continuous(name = "Média de Ozônio em Partes por bilhão") # Altera o título do eixo y,
#sendo que esta função pode  receber outros parâmetros também

# visualizando as mudanças...
p10


# Agora precisamos adicionar um título ao nosso gráfico
# para isso utilizamos a função ggtitle()

p10 <- p10 + ggtitle("Boxplot da média mensal de ozônio")

#visualizando o resultado
p10


#Alterando o plano de fundo

#para alterarmos o plano de fundo, utilizamos  a seguinte função

p10 <- p10 + theme_bw() #Há varias funções theme_ (pesquisar)

#visualizando os resultados
p10


#Alterando a cor do boxplot

p10 <- p10 + geom_boxplot(fill = "blue", colour = "black") # Lembre-se que fill se refere ao preenchimento
# e colour se refere ao contorno da forma

#visualiando os resultados
p10

# podemos também alterar os limites dos gráficos nos eixos x e y
p10 <- p10 + scale_y_continuous(breaks  = seq(0,175, 25)) # O comando breaks é usado para particionar o  eixo

# do jeito que aí está, o eixo será particionado de 25 em 25 de 0 até 175
p10


# Esse é um exemplo simples, há vários outros argumentos que podem ser alterados
# e adicionados para criação do gráfico, o importante é fixar os conceitos e a gramática dos gráficos,
# isto é, o processo de criação dos gráficos.