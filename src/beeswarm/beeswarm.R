# install.packages("beeswarm")
library(beeswarm)

# Data generation
set.seed(1995)
x <- rnorm(300)
g <- sample(c("G1", "G2", "G3"),
            size = 300, replace = TRUE)

# Bee swarm plot by group
beeswarm(x ~ g,
         pch = 19, 
         col = c("#3FA0FF", "#FFE099", "#F76D5E")) 

