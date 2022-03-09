
library(ggplot2)
  
# make this example reproducible
set.seed(0)
  
# create data frame
index<-1:40
y<-sample(5:40,40,replace=TRUE)
df <- data.frame( index, y )
  
# create frequency polygon using geom_freqpoly()
# function
ggplot(df, aes(y)) + 
  geom_freqpoly(bins=10)
