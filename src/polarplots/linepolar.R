library(plotly)

df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/polar_dataset.csv")

fig <- plot_ly(
  df,
  type = 'scatterpolar',
  mode = 'lines'
  ) 
fig <- fig %>%
  add_trace(
    r = ~x1,
    theta = ~y,
    name = 'Figure8',
    line = list(
      color = 'peru'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x2,
    theta = ~y,
    name = 'Cardioid',
    line = list(
      color = 'darkviolet'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x3,
    theta = ~y,
    name = 'Hypercardioid',
    line = list(
      color = 'deepskyblue'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x4,
    theta = ~y,
    name = 'Subcardioid',
    line = list(
      color = 'orangered'
    )
  ) 
fig <- fig %>%
  add_trace(
    r = ~x5,
    theta = ~y,
    name = 'Supercardioid',
    line = list(
      color = 'green'
    )
  ) 

fig <- fig %>%
  layout(
    title = 'Mic Patterns',
    font = list(
      family = 'Arial',
      size = 12,
      color = '#000'
    ),
    showlegend = F
  )

fig
