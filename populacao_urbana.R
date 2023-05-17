data("ipeadata_11_04_2023_12_41_populacao_urbana")
View(ipeadata_11_04_2023_12_41_populacao_urbana)
colnames(ipeadata_11_04_2023_12_41_populacao_urbana)
as_tibble(ipeadata_11_04_2023_12_41_populacao_urbana)

#instalando pacotes#
install.packages("janitor")
install.packages("ggpplot2")
install.packages("scales")

#pacotes usados na limpeza#
library("dplyr")
library("tidyverse")
library("here")
library("skimr")
library("janitor")
library("ggplot2")
library("scales")

# Adicionando o Vetor e Lista# 
populacao_urbana <- ipeadata_11_04_2023_12_41_populacao_urbana

#renomeando coluna#
populacao_urbana %>%
  rename(Populacao_Urbana = "População residente - urbana - Habitante - Instituto Brasileiro de Geografia e Estatística, Departamento de População e Indicadores Sociais. Divisão de Estudos e Análises da Dinâmica Demográfica (IBGE/Pop) - DEPIS_POPURB -")

#mostrar as primeiras linhas#
head(populacao_urbana)

#para renomear a coluna#
head(rename(populacao_urbana, 
       Populacao_Residente="População residente - urbana - Habitante - Instituto Brasileiro de Geografia e Estatística, Departamento de População e Indicadores Sociais. Divisão de Estudos e Análises da Dinâmica Demográfica (IBGE/Pop) - DEPIS_POPURB -"))

#renomeando e fixando coluna#
populacao_urbana <- populacao_urbana %>% 
  rename(Populacao_Residente_Urbana="População residente - urbana - Habitante - Instituto Brasileiro de Geografia e Estatística, Departamento de População e Indicadores Sociais. Divisão de Estudos e Análises da Dinâmica Demográfica (IBGE/Pop) - DEPIS_POPURB -")
populacao_urbana <- populacao_urbana %>% rename(A)

#criando serie temporal#
Tpop_urb= ts(populacao_urbana, start = c(1940, 1), end = c(2010, 1), frequency = 1)

#plotando o gráfico#
plot(Tpop_urb)
tpopurb = Tpop_urb[,2]
plot(tpopurb)
plot(tpopurb, main="População Urbana Residente", xlab="Ano", ylab="População em milhões de habitantes") 

#Criando Grafico 2#
ggplot(populacao_urbana,aes(x=Ano, y=Populacao_Residente))+geom_line(size = .8)

#verifiacando estrutura do data frame#
head(populacao_urbana)
str(populacao_urbana)
colnames(populacao_urbana)

#para remover a notação cientifica do eixo y#
options(scipen = 999)

View(populacao_urbana)
