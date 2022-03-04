# bars

# > single bars

# 1. barplot() fn
sequence_of_things <- c(22, 27, 26, 24, 23, 26, 28)

barplot(sequence_of_things,
        main = "Title goes here..",
        xlab = " x-axis label",
        ylab = "y-axis label",
        names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        col = "darkred",
        border="white",
        horiz = FALSE)

# 2. ggplot

# geom bar vs geom col

# The key difference is how they aggregate the data by default.

# For geom_bar(), the default behavior is to count the rows for each x value. 
#It doesn't expect a y-value, since it's going to count that up itself -- in fact, 
#it will flag a warning if you give it one, since it thinks you're confused. 
#How aggregation is to be performed is specified as an argument to geom_bar(), 
#which is stat = "count" for the default value.

# If you explicitly say stat = "identity" in geom_bar(), 
#you're telling ggplot2 to skip the aggregation and that you'll provide the y values. 


#If you have y values, you could use either syntax

ggplot(data=df, aes(x=x, y=y)) +
  geom_bar(stat="identity", color="blue", fill="white", width=0.5)



# grouped bars - use position=position_dodge()
ggplot(data=df, aes(x=x, y=y, fill=group)) +
  geom_bar(stat="identity", position=position_dodge())

# > bar labels - geom_text()
ggplot(data=df, aes(x=x, y=y, fill=group)) +
  geom_bar(stat="identity", position=position_dodge())+
  geom_text(aes(label=len), vjust=1.6, color="white",
            position = position_dodge(0.9), size=3.5)


# stacked bars - get the cumulative sum of the bars first
ggplot(data=df_cumsum, aes(x=x, y=y, fill=group)) +
  geom_bar(stat="identity")+
  geom_text(aes(y=label_ypos, label=xaxislab), vjust=1.6, 
            color="white", size=3.5)


# bar plots with error bars - geom_errorbar() w/ sd window
ggplot(df, aes(x=x, y=, fill=group)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=len-sd, ymax=len+sd), width=.2,
                position=position_dodge(.9))




