## AnalyzeRBC
![doi](../master/Images/zenodo.3373938.svg?sanitize=true)
### Single regressions, and scatterplots for clinical bloodwork and gene expression data.
([AnalyzeRBC.R](../master/AnalyzeRBC.R)) will allow you to load a comma-delimited .csv with various datapoints, perform single and multiple regressions of Body Mass Index (BMI) vs. variables from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D and 3-D scatterplots for the results. 

Data (RobinsonEtAl_Sup1.csv) was downloaded from: 

Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

### Single Regression Test, BMI vs. Bloodwork parameter
RBC.regression <- lm(BMI ~ RBC, data = IBS1)
summary(RBC.regression)

### Results of single regression, RBC scatterplot
ggplot(IBS1, aes(x = BMI, y = RBC)) +
  geom_point() +    
  geom_smooth(method = lm) 

png("fig_output/RBC_scatterplot.png")
RBC_scatterplot <- ggplot(IBS1, aes(x = BMI, y = RBC)) +
  geom_point() +    
  geom_smooth(method = lm) 

print(RBC_scatterplot)

Call:
lm(formula = BMI ~ RBC, data = IBS1)

Coefficients:
(Intercept)    RBC  
     21.869        2.458
![](fig_output/RBC_scatterplot.png)

### Results of single regression, BMI x Bloodwork parameter
boxplot(RBC ~ IBS.subtype, data = IBS1, main="RBC by IBS subtype", 
        xlab = "IBS.subtype", ylab = "RBC"
)

png("fig_output/RBC_boxplot.png")
RBC_boxplot <- boxplot(RBC ~ IBS.subtype, data = IBS1, main="RBC by IBS subtype", 
                       xlab = "IBS.subtype", ylab = "RBC"
)
print(RBC_boxplot)
![](fig_output/RBC_boxplot.png)

