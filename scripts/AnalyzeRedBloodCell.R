## BTEC330 Fosso Project2

## install.packages("ggplot2")
library(ggplot2)

## Set working directory

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)

## Single Regression Test
RBC.regression <- lm(DROSHA ~ Red.Blood.Cells..RBC...trillion.cells.L., data=IBS1)
summary(RBC.regression)

## Scatterplot
ggplot(IBS1, aes(x=DROSHA, y=Red.Blood.Cells..RBC...trillion.cells.L.)) +
  geom_point() +    
  geom_smooth(method=lm) 

