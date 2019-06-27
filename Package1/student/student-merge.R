
rm(list=ls(all=TRUE))  # borramos variables calculadas
# Data Preprocessing Template

#*****************************************************
# IPL ----
#*****************************************************

sistema_operativo <- "Windows"
# sistema_operativo <- "MACOS"
# sistema_operativo <- "Linux" # OJO! no lo he probado

# ordenador <- "PC"
ordenador <- "PC"

# environment
enviro <- "/OneDrive/Artificial Intelligence/99 - Cursos a Impartir/40 - EOI - R y ML/Modulo II"
Portatil_raiz <- "C:/Users/User"
PC_raiz <- "D:"
MACOS_raiz <- "~"

arranque <- ""

if( sistema_operativo == "MACOS"){
  arranque <- paste0(MACOS_raiz, enviro)
  # setwd("~/OneDrive/Artificial Intelligence/99 - Cursos a Impartir/40 - EOI - R y ML/Modulo II") # marco el directorio de trabajo del script # mac
} else {
  
  if( ordenador == "PC")
    arranque <- PC_raiz
  if( ordenador == "Portatil")
    arranque <- Portatil_raiz
  
  arranque <- paste0(arranque, enviro)
}

setwd(arranque) # windows

getwd()


mydata.splitRatio <- 0.8

#*****************************************************
# Carga de las librerías que necesitaremos ----
#*****************************************************

if(!require(tidyverse)) install.packages("tidyverse",repos = "http://cran.us.r-project.org")
if(!require(dplyr)) install.packages("dplyr",repos = "http://cran.us.r-project.org")
if(!require(corrplot)) install.packages("corrplot",repos = "http://cran.us.r-project.org")
if(!require(ggplot2)) install.packages("ggplot2",repos = "http://cran.us.r-project.org")
if(!require(gridExtra)) install.packages("gridExtra",repos = "http://cran.us.r-project.org")
if(!require(ggthemes)) install.packages("ggthemes",repos = "http://cran.us.r-project.org")
if(!require(caret)) install.packages("caret",repos = "http://cran.us.r-project.org")
if(!require(MASS)) install.packages("MASS",repos = "http://cran.us.r-project.org")
if(!require(randomForest)) install.packages("randomForest",repos = "http://cran.us.r-project.org")
if(!require(gapminder)) install.packages("gapminder",repos = "http://cran.us.r-project.org")
if(!require(party)) install.packages("party",repos = "http://cran.us.r-project.org")
if(!require(plyr)) install.packages("plyr",repos = "http://cran.us.r-project.org")

library(tidyverse)
library(dplyr)
library(corrplot)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(caret)
library(MASS)
library(randomForest)
library(party)
library(plyr)

# forma alternativa de cargar paquetes
# source: https://www.kaggle.com/linglingsun07/home-credit-default

packages = c('tidyverse', 'dplyr', 'corrplot', 'ggplot2', 'gridExtra')
lapply(packages, require, character.only = TRUE)

#*****************************************************
# Importing the dataset ----
#*****************************************************


d1=read.table("Data/student-mat.csv",sep=";",header=TRUE)
d2=read.table("Data/student-por.csv",sep=";",header=TRUE)

d3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

write.csv(d3, file="Data/student_merged.csv")
print(nrow(d3)) # 382 students
