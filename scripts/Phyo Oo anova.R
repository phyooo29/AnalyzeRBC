## install.packages("ggplot2")
library(ggplot2)

## Set working directory

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)


## ANOVA: IBS-subtype vs. Gene
CD8A.aov <- aov(CD8A ~ IBSsubtype, data = IBS1)
summary(CD8A.aov)
sink('../data_output/CD8A.txt', append = TRUE)
print(CD8A.aov)
sink()

## Print out a boxplot
png("../fig_output/CD8A.png")
CD8A_boxplot <- boxplot(CD8A ~ IBSsubtype, data = IBS1, main="CD8A by IBS1 subtype", 
                          xlab = "IBS.subtype", ylab = "CD8A"
)

## ANOVA: IBS-subtype vs. Gene
CD6.aov <- aov(CD6 ~ IBSsubtype, data = IBS1)
summary(CD6.aov)
sink('../data_output/CD6.txt', append = TRUE)
print(CD6.aov)
sink()

## Print out a boxplot
png("../fig_output/CD6.png")
CD6_boxplot <- boxplot(CD6 ~ IBSsubtype, data = IBS1, main="CD6 by IBS1 subtype", 
                          xlab = "IBS.subtype", ylab = "CD6"
)
dev.off()

## ANOVA: IBS-subtype vs. Gene
CD3G.aov <- aov(CD3G ~ IBSsubtype, data = IBS1)
summary(CD3G.aov)
sink('../data_output/CD3G.txt', append = TRUE)
print(CD3G.aov)
sink()

## Print out a boxplot
png("../fig_output/CD3G.png")
CD3G_boxplot <- boxplot(CD3G ~ IBSsubtype, data = IBS1, main="CD3G by IBS1 subtype", 
                          xlab = "IBS.subtype", ylab = "CD3G"
)
dev.off()

## ANOVA: IBS-subtype vs. Gene
CD3E.aov <- aov(CD3E ~ IBSsubtype, data = IBS1)
summary(CD3E.aov)
sink('../data_output/CD3E.txt', append = TRUE)
print(CD3E.aov)
sink()

## Print out a boxplot
png("../fig_output/CD3E.png")
CD3E_boxplot <- boxplot(CD3E ~ IBSsubtype, data = IBS1, main="CD3E by IBS1 subtype", 
                          xlab = "IBS.subtype", ylab = "CD3E"
)
dev.off()

## ANOVA: IBS-subtype vs. Gene
CD2.aov <- aov(CD2 ~ IBSsubtype, data = IBS1)
summary(CD2.aov)
sink('../data_output/CD2.txt', append = TRUE)
print(CD2.aov)
sink()

## Print out a boxplot
png("../fig_output/CD2.png")
CD2_boxplot <- boxplot(CD2 ~ IBSsubtype, data = IBS1, main="CD2 by IBS1 subtype", 
                          xlab = "IBS.subtype", ylab = "CD2"
)
dev.off()

