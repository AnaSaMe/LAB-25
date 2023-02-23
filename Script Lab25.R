#---------------LABORATORIO 25---------------------
# Tidy data - datos ordenados - Parte 1

#Objetivo: Introducción práctica a los datos ordenados (o tidy data) y a las herrameintas que provee el paquete tidyr.
#-------------------------------------------------------------------------------------------
#En este ejecicio vamos a:
#1. Cargar datos (tibbles)
#2. Convesrtir nuestros tibbles en datadrames (para su exportación)
#3. Exportar dataframes originales
#4. Pivotar tabla 4a
#5. Exportar resultado (TABLA PIVOTANTE)

#Prerrequisitos. instalar paquete tidyverse
install.packages("tidyverse")

#Instalar paquete de datos
install.packages("remotes")
remotes::install_github("cienciadedatos/datos")
install.packages("datos")

#Cargar paquete tidyverse
library(tidyverse)

#Cargar paquete de datos
library("datos")

#Tabla 1 hasta tabla 4b. Ver datos como tibble
datos::tabla1

#Cargas las otras cuatro tablas del paquete de datos
datos::tabla2
datos::tabla3
datos::tabla4a
datos::tabla4b
#La visualización de los datos es como tibble, es como un dataframe pero no se puede exportar, cambiar variables (hay ciertas limitantes).

#Convirtiendo tibble a dataframe
#Primer datadrame (df1) que sea igual a la importación de un data_frame de la tabla1. 
df1 <- data_frame(tabla1)
#Ahora ya aparece en el Environment y se puede exportar

#Se ejecuta la misma indicación con las tablas restantes, asigando nombre de dataframe con base en la tabla.
df2 <- data_frame(tabla2)
df3 <- data_frame(tabla3)
df4a <- data_frame(tabla4a)
df4b <- data_frame(tabla4b)

#Para visualizar
df1
df2
df3
df4a
df4b

#¿Cuál de las bases está ordenada y cuál está desordenada?
#Los datos irdenados tienen tres características esenciales
#1. Cada variable debe contener su propia columna
#2. Cada observación debe tener su propia fila 
#3. Cada valor debe tener su propia celda

#Exportar los dataframes originales
write.csv(df1,file="df1.csv")

#Se hace lo mismo con los otros dataframes
write.csv(df2,file="df2.csv")
write.csv(df3,file="df3.csv")
write.csv(df4a,file="df4a.csv")
write.csv(df4b,file="df4b.csv")

#Ordenando los datos. 
#Explicación de tibble en cuadrante de visualizaciones
vignette("tibble")

#La mayoría de las funciones que usarás en este libro, producen tibbles, ya que son una de las caracterísitcas transversales del tidyverse.
#Si ya te has familiarizado con data.frame(), es importante que tomes en cuanta que tibble() hace menos cosas.
#Nunca cambia el tipo de los inputs (p. ej., ¡nunca convierte caracteres en factores!)
#Nunca cambia el nombre de las variables y nunca asigna nombres a las filas.

#ordenar datos con la tabla4a (PIVOTAR). Se añade el operador pipe %>% (presionando ctrl Shift M)
#Se genera objeto llamado t4a_PIVOTANTE (será una tabla ordenada), para pivotear a lo largo (pivot_longer)
#Las columnas están dadas por los años y se reemplazará el nombre por anio en los que englobará los dos momentos en el tiempo.
#Los valores se tomarán como casos.
t4a_PIVOTANTE = tabla4a %>%
  pivot_longer(cols=c("1999", "2000"), names_to="anio", values_to = "casos")

#Para visualizar
t4a_PIVOTANTE

#Exportar resultados: tabla ordenada
write.csv(t4a_PIVOTANTE, file="t4a_PIVOTANTE.csv")

tinytex::install_tinytex()
  