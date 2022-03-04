install.packages("remotes")
remotes::install_github("davidsjoberg/ggstream")
library(ggstream)
library(ggplot2)

# standard
ggplot(data, aes(x=x_values, y=y_values, fill=other_values)) +
  geom_stream() + 
  geom_stream_label(aes(label=label_values))

#ridge
ggplot(data, aes(x=x_values, y=y_values, fill=other_values)) +
  geom_stream() + 
  geom_stream(type="ridge")

#proportional
ggplot(data, aes(x=x_values, y=y_values, fill=other_values)) +
  geom_stream() + 
  geom_stream(type="proportional")

# change fill colors
colors <- c("13AF40", "#FFB100", "#C20008", "#FFC740")

ggplot(data, aes(x=x_values, y=y_values, fill=other_values)) +
  geom_stream() +
  scale_fill_manual(values = colors)

