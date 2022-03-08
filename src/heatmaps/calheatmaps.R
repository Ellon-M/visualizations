# calendar heatmaps 

# doc - https://cran.r-project.org/web/packages/calendR/calendR.pdf

install.packages("calendR")
library(calendR)


#data
set.seed(2)
data <- rnorm(365)

#calendar
calendR(year= 2021,
        start= "M",
        special.days = data,
        gradient = TRUE,
        low.col = "#FCFFDD",
        special.col = "#00AAAE",
        legend.pos = "right",
        legend.title = "Years")
