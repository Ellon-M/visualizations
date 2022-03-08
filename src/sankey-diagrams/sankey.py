# sankey diagram

# holoviews
import holoviews as hv
from holoviews import dim, opts

hv.extension("matplotlib")
nodes = [
    "PhD",
    "Career Outside Science",
    "Early Career Researcher",
    "Research Staff",
    "Permanent Research Staff",
    "Professor",
    "Non-Academic Research",
]
nodes = hv.Dataset(enumerate(nodes), "index", "label")
edges = [
    (0, 1, 53),
    (0, 2, 47),
    (2, 6, 17),
    (2, 3, 30),
    (3, 1, 22.5),
    (3, 4, 3.5),
    (3, 6, 4.0),
    (4, 5, 0.45),
]

value_dim = hv.Dimension("Percentage", unit="%")
hv.Sankey((edges, nodes), ["From", "To"], vdims=value_dim).opts(
    opts.Sankey(
        cmap="Set1",
        labels="label",
        label_position="right",
        edge_color=dim("To").str(),
        node_color=dim("index").str(),
    )
)



# plotly

import plotly.express as px
import plotly.graph_objects as go

labels = ["A1", "A2", "B1", "B2", "C1", "C2"]

fig = go.Figure(
    data=[
        go.Sankey(
            node=dict(
                pad=15,
                thickness=20,
                line=dict(color="black", width=0.5),
                label=labels,
                color=px.colors.qualitative.Plotly[: len(labels)],
            ),
            # indices correspond to labels, eg A1, A2, A1, B1, ...
            link=dict(
                source=[0, 1, 0, 2, 3, 3, 2],
                target=[2, 3, 3, 4, 4, 5, 5],
                value=[7, 3, 2, 6, 4, 2, 1],
            ),
        )
    ]
)

fig.update_layout(title_text="Basic Sankey Diagram", font_size=10)
fig.show()
