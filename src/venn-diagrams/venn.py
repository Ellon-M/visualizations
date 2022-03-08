# venn

import plotly.graph_objects as go

fig = go.Figure()

# Create scatter trace of text labels
fig.add_trace(go.Scatter(
    x=[1, 1.75, 2.5],
    y=[1, 1, 1],
    text=["$A$", "$A+B$", "$B$"],
    mode="text",
    textfont=dict(
        color="black",
        size=18,
        family="Arail",
    )
))

# Update axes properties
fig.update_xaxes(
    showticklabels=False,
    showgrid=False,
    zeroline=False,
)

fig.update_yaxes(
    showticklabels=False,
    showgrid=False,
    zeroline=False,
)

# Add circles
fig.add_shape(type="circle",
    line_color="blue", fillcolor="aqua",
    x0=0, y0=0, x1=2, y1=2
)
fig.add_shape(type="circle",
    line_color="gray", fillcolor="peachpuff",
    x0=1.5, y0=0, x1=3.5, y1=2
)
fig.update_shapes(opacity=0.3, xref="x", yref="y")

fig.update_layout(
    margin=dict(l=20, r=20, b=100),
    height=600, width=800,
    plot_bgcolor="white"
)

fig.show()
