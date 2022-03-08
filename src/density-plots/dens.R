# density plots

library(ggplot2)

# 1. Normal curve on histograms
said_colm <- df$colm

h <- hist(said_colm,
          breaks=10,
          col="red",
          xlab="X axis label",
          ylab="y axis label"
)

xfit<-seq(min(said_colm), max(said_colm), length=40)
yfit<-dnorm(xfit, mean=mean(said_colm), sd=sd(said_colm))
yfit<-yfit * diff(h$mids[1:2]) * length(said_colm)

lines(xfit, yfit, col="blue", lwd=2)


# 2. KDEs

d <- density(said_colm,
             main="Title...",
             )
polygon(d, col="red", border="black")
plot(d)



# 3. ggplot

p <- ggplot(df, aes(x=colm)) +
  geom_density(color="darkblue", fill="red")



