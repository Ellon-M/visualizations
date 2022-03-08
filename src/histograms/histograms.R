# histograms
 library(ggplot2)
 
 # with ggplot
 # > quick plot
 qplot(df$col,
       geom = histogram,
       binwidth = 5,
       main = "Title goes here",
       xlab = "x axis label",
       ylab = " y axis label",
       fill = I("blue"),
       col = I("red"),
       alpha = I(.2),
       xlim = c(20, 50),
       ylim = c(10, 100),
       #.......
 )
 
 # > ggplot
 ggplot(data = df,
        aes(df$col)) +
   geom_histogram(breaks=seq(20, 50, by=2),
                  col='red', fill='green', alpha=.2) +
   labs(title="Title goes here", x="x axis label", y="y axis label") +
   xlim(c(20, 50)) +
   ylim(c(10, 100))

 
 # with hist() fn
 
 said_column <- df$column
 
 hist(said_column,
      breaks= 20,
      main="Title goes here",
      xlab="x axis label",
      ylab="y axis label",
      col='red',
      freq=FALSE
      )
 
 
 