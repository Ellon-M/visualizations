# install.packages("CGPfunctions")
library(CGPfunctions)

newggslopegraph(dataframe = df,
                Times = Year,
                Measurement = GDP,
                Grouping = Country)
