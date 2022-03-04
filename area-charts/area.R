library(ggplot2)

# single
x <- 1:50
y <- cumsum(rnorm(50))
df <- data.frame(x, y)


ggplot(df, aes(x=x, y=y)) +
       geom_area(fill="blue", alpha=2) +
       labs(x="X axis label", y="y axis label") +
        ggtitle("Title goes here") 


#stacked
library(dplyr)

x <- as.numeric(rep(seq(1, 7), each=7))
y <- runif(49, 30, 100)
group <- rep(LET[1:7], times=7)
df <- data.frame(x, y, group)

ggplot(df, aes(x=x, y=y, fill=group)) +
  geom_area()