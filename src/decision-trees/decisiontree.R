# Load rpart and rpart.plot
library(rpart)
library(rpart.plot)
# Create a decision tree model
tree <- rpart(survived~., data=TitanicData, cp=.02)
# Visualize the decision tree with rpart.plot
rpart.plot(tree, box.palette="RdBu", shadow.col="gray", nn=TRUE)
