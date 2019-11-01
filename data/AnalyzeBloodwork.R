## BTEC330 Robinson Project2


## Install necessary packages

install.packages("ggplot2")
library(ggplot2)
library(ggplot2)

install.packages("scatterplot3d")
library(scatterplot3d)

## Read data
IBS1 <- read.csv("RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS1)
write.csv(IBS1, "data_output.csv")

##  Single Regressions for BMI vs. each blood data variable
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

## Single Regression Test
single.regression <- lm(BMI ~ RBC, data=IBS1)
summary(single.regression)



## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html


ggplot(IBS1, aes(x=BMI, y=RBC)) +
  geom_point() +    
  geom_smooth(method=lm) 





