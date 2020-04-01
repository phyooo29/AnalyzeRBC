# <p align="center"> *AnalyzeRBC* </p>

# <p align="center"> *Phyo Oo* </p>

![doi](../master/Images/zenodo.3373938.svg?sanitize=true)
### Single regressions, and scatterplots for clinical bloodwork and gene expression data.
([AnalyzeBloodwork.R]https://github.com/phyooo29/AnalyzeRBC/blob/master/data/AnalyzeBloodwork.R) will allow you to load a comma-delimited .csv with various datapoints, perform single and multiple regressions of Body Mass Index (BMI) vs. variables from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D and 3-D scatterplots for the results. 

### Red Blood Cell (RBC) :
Red blood cell is also known as red cell, red blood corpuscles, haematids, erythroid cells or erythrocytes. Red Blood Cells are the most common type of blood cell and the vertevrate's principle means of delivering oxygen (O2) to the body tissues - via blood flow through the circulatory system.The primary function of red blood cells is to transport oxygen to body cells and deliver carbon dioxide to the lungs. A red blood cell has what is known as a biconcave shape.

Wikipedia, Red Blood Cell, https://en.wikipedia.org/wiki/Red_blood_cell

Regina bailey ( July 28, 2019 ) Red Blood Cells (Erythrocytes) : Structure Function, and Related Disorders 
https://www.thoughtco.com/red-blood-cells-373487


Data (RobinsonEtAl_Sup1.csv) was downloaded from: 
Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

### Single Regression Test, BMI vs. Bloodwork parameter
>RBC.regression <- lm(BMI ~ RBC, data = IBS1)
summary(RBC.regression)

### Results of single regression, RBC scatterplot
>ggplot(IBS1, aes(x = BMI, y = RBC)) +
  geom_point() +    
  geom_smooth(method = lm) 

>png("fig_output/RBC_scatterplot.png")
>RBC_scatterplot <- ggplot(IBS1, aes(x = BMI, y = RBC)) +
  geom_point() +    
  geom_smooth(method = lm) 

>print(RBC_scatterplot)

>Call:
lm(formula = BMI ~ RBC, data = IBS1)

>Coefficients:
(Intercept)    RBC  
     21.869        2.458
![](fig_output/RBC_scatterplot.png)

## Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the RBC_result parameter

IBS1$RBC_result[IBS1$RBC > 6.1] <- "HIGH"

IBS1$RBC_result[IBS1$RBC <= 6.1 & IBS1$RBC >= 4.6] <- "NORMAL"

IBS1$RBC_result[IBS1$RBC < 4.6] <- "LOW"


### Results of single regression, BMI x Bloodwork parameter
## Box plots
## https://www.statmethods.net/graphs/boxplot.html

>ggplot(IBS1, aes(x=BMI, y=RBC)) +
geom_boxplot(alpha=0.3) +
  theme(legend.position="none")

>boxplot(RBC ~ IBS.subtype, data = IBS1, main="RBC by IBS subtype",
        col=(c("gold" , "darkgreen")), 
        xlab = "IBS.subtype", ylab = "RBC"
        
      
)
>png("fig_output/RBC_boxplot.png")
>RBC_boxplot <- boxplot(RBC ~ IBS.subtype, data = IBS1, main="RBC by IBS subtype",
                       col=(c("gold" , "darkgreen")),
                       xlab = "IBS.subtype", ylab = "RBC"
)
>print(RBC_boxplot)
dev.off()

![](fig_output/RBC_boxplot.png)


