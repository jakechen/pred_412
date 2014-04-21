# 0 Data import
library(ggplot2)
library(MMST)
data(wine)

# 1 EDA
head(wine)
str(wine)
summary(wine)

## 1.1 Graphical
for(i in 1:(ncol(wine)-2)){
  p <- ggplot(wine, aes(x=wine[,i], fill=class)) +
    geom_density(aes(alpha=0.5)) +
    labs(x=names(wine)[i])
  print(p)
}

