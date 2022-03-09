data <- data.frame(name = c('Bob', 'Greg', 'Mike', 'Andy'), 
start = c(4, 7, 12, 16),
end = c(12, 11, 8, 22),
shift_type = c('early', 'mid_day', 'mid_day', 'late')
)

#install (if not already installed) and load ggplot2
if(!require(ggplot2)){install.packages('ggplot2')}

#create gantt chart that visualizes start and end time for each worker
ggplot(data, aes(x=start, xend=end, y=name, yend=name, color=shift_type)) +
  geom_segment()


ggplot(data, aes(x=start, xend=end, y=name, yend=name, color=shift_type)) +
  theme_bw()+ #use ggplot theme with black gridlines and white background
  geom_segment(size=8) + #increase line width of segments in the chart
  labs(title='Worker Schedule', x='Time', y='Worker Name')



