# Prompt: 
# This individual assignment asks students to use a statistical experiment
# to compare alternative classification methods. Students are encouraged
# to install packages with data-adaptive, machine learning algorithms. 
# Ensemble methods (committee machines) may also be employed. Various criteria,
# tabular, and graphical (including receiver operating characteristic curves)
# are used for evaluating classifiers. Try at least one traditional and one
# machine learning method.

# 1. Load datasets
library(MMST)
data(spambase)

# 2. EDA
str(spambase)
head(spambase)
summary(spambase)

## 2.1 Vs Each Other
require(corrgram)
mask <- sample(c(T,F), nrow(spambase), replace=T, prob=c(0.1, 0.9))
temp <- spambase[mask,]
corrgram(temp, upper.panel=panel.conf, lower.panel=panel.pie)
# ^ Heavy multicollinearity between x857 through technology (minus data)
corrgram(spambase[,25:40], upper.panel=panel.conf, lower.panel=panel.pie)
# ^ Cor(x857, x415) = 1

## Vs Target
require(ggplot2)
for(i in 1:(nrow(spambase))){
  ggplot(spambase, aes(x=spambase[,2], fill=class, alpha=0.5)) +
    geom_density()
}

# 3. Transformations
# 3.1 Remove redundancy
data <- spambase[,-34]
