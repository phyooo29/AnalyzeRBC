## BTEC330 F2019 Project2 Robinson

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)

## Read data
IBS1 <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS1)

IBS1$RBC_result <- "NA"

## Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the RBC_result parameter

IBS1$RBC_result[IBS1$RBC > 6.1] <- "HIGH"

IBS1$RBC_result[IBS1$RBC <= 6.1 & IBS1$RBC >= 4.6] <- "NORMAL"

IBS1$RBC_result[IBS1$RBC < 4.6] <- "LOW"

write.csv(IBS1, "data_output/RBC.csv")

##  Single Regressions 
##  Data obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

## Single Regression Test, BMI vs. Bloodwork parameter
RBC.regression <- lm(BMI ~ RBC, data = IBS1)
summary(RBC.regression)

## Output the results to a file
## http://www.cookbook-r.com/Data_input_and_output/Writing_text_and_output_from_analyses_to_a_file/
sink('data_output/RBC_regression.txt', append = TRUE)
print(RBC.regression)
sink()

## ANOVA: IBS1-subtype vs. Bloodwork parameter
## http://www.sthda.com/english/wiki/one-way-anova-test-in-r
RBC.aov <- aov(RBC ~ IBS.subtype, data = IBS1)
summary(RBC.aov)
sink('data_output/RBC_anova.txt', append = TRUE)
print(RBC.aov)
sink()

## Print scatterplot and box plots as .png files into "fig_output" project directory.
## http://www.sthda.com/english/wiki/ggsave-save-a-ggplot-r-software-and-data-visualization

## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html

ggplot(IBS1, aes(x = BMI, y = RBC)) +
  geom_point() +    
  geom_smooth(method = lm) 

png("fig_output/RBC_scatterplot.png")
RBC_scatterplot <- ggplot(IBS1, aes(x = BMI, y = RBC)) +
  geom_point() +    
  geom_smooth(method = lm) 

print(RBC_scatterplot)
dev.off()

## Box plots
## https://www.statmethods.net/graphs/boxplot.html

ggplot(IBS1, aes(x=BMI, y=RBC)) +
geom_boxplot(alpha=0.3) +
  theme(legend.position="none")

boxplot(RBC ~ IBS.subtype, data = IBS1, main="RBC by IBS subtype",
        col=(c("gold" , "darkgreen")), 
        xlab = "IBS.subtype", ylab = "RBC"
        
      
)
png("fig_output/RBC_boxplot.png")
RBC_boxplot <- boxplot(RBC ~ IBS.subtype, data = IBS1, main="RBC by IBS subtype",
                       col=(c("gold" , "darkgreen")),
                       xlab = "IBS.subtype", ylab = "RBC"
)
print(RBC_boxplot)
dev.off()

