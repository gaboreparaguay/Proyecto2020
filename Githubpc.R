###Scrapping

linkPage= "https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic"
linkPath = '//*[@id="thetable"]'
#El id=thetable es el código particular de la tabla de datos en wikipedia

library(htmltab)
#Estamos creando un nuevo objeto con el nombre "coronavirus"
coronavirus = htmltab(doc = linkPage, which =linkPath, rm_nodata_cols = F) 

###Limpieza
head(coronavirus)
coronavirus = coronavirus[,c(2:5)]

###Cambiando los nombres
names(coronavirus)

new_names = c("Paises", "Casos", "Muertes", "Recuperados")

names(coronavirus) = new_names
names (coronavirus)

###Eliminando los pie de p?ginas

coronavirus = coronavirus[-c(229:230),]
View(coronavirus)

###Algo m?s de limpieza para el valor â€“

library(dplyr)
coronavirus = coronavirus %>% 
  mutate(Recuperados = replace(Recuperados, Recuperados == 'NA', NA))

View(coronavirus)

###Análisis

str(coronavirus)