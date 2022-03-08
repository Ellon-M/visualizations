# line polar
import plotly.graph_objects as go

import pandas as pd

df = pd.read_csv("https://raw.githubusercontent.com/plotly/datasets/master/polar_dataset.csv")

fig = go.Figure()
fig.add_trace(go.Scatterpolar(
        r = df['x1'],
        theta = df['y'],
        mode = 'lines',
        line_color = 'peru'
    ))
fig.add_trace(go.Scatterpolar(
        r = df['x2'],
        theta = df['y'],
        mode = 'lines',
        line_color = 'darkviolet'
    ))
fig.add_trace(go.Scatterpolar(
        r = df['x3'],
        theta = df['y'],
        mode = 'lines',
        line_color = 'deepskyblue'
    ))


fig.update_layout(
    showlegend = False
)

fig.show()


