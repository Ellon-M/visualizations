# marimekko

devtools::install_github("haleyjeppson/ggmosaic")
library(ggplot2)


# blank
p <- ggplot(subset) +
     geom_mosaic(aes(x = x_axis_data, fill = independent_var,
                  weight = independent_var), na.rm=TRUE) +
                  ylab("") + xlab("x axis label goes here") +
                  labs(title = "Title goes here",
                  subtitle = "subtitle goes here",
                  caption="caption goes here") + theme_minimal() +
                  theme(legend.position = "right",
                  panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(),
                  panel.border = element_blank(),
                  panel.background = element_blank())

# add labels to individual rectangles
p <- p + geom_text(size = 3, data = label_data, aes(x = (xmax+xmin)/2, y = (ymin+ymax)/2))