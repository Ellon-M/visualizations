# treemaps

install.packages("treemapify")
library(treemapify)
library(ggpplot2)

ggplot(df, aes(area = value, fill=value, label=group)) +
       geom_treemap() + 
       geom_treemap_text(colour = c(rep("white", 2), 1, rep("white", 6)), 
                         place = "centre", size = 15)