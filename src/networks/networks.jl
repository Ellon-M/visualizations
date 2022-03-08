using PlotlyJS, LightGraphs
import GraphPlot  # for spring_layout

# Generate a random layout
G =  LightGraphs.euclidean_graph(200, 2, cutoff=0.125)[1]
# Position nodes
pos_x, pos_y = GraphPlot.spring_layout(G)

# Create plot points
edge_x = []
edge_y = []

for edge in edges(G)
    push!(edge_x, pos_x[src(edge)])
    push!(edge_x, pos_x[dst(edge)])
    push!(edge_y, pos_y[src(edge)])
    push!(edge_y, pos_y[dst(edge)])
end

#  Color node points by the number of connections.
color_map = [size(neighbors(G, node))[1] for node in 1:200]

# Create edges
edges_trace = scatter(
    mode="lines",
    x=edge_x,
    y=edge_y,
    line=attr(
        width=0.5,
        color="#888"
    ),
)

# Create nodes
nodes_trace = scatter(
    x=pos_x,
    y=pos_y,
    mode="markers",
    text = [string("# of connections: ", connection) for connection in color_map],
    marker=attr(
        showscale=true,
        colorscale=colors.imola,
        color=color_map,
        size=10,
        colorbar=attr(
            thickness=15,
            title="Node Connections",
            xanchor="left",
            titleside="right"
      )
    )
)

# Create Plot
plot(
    [edges_trace, nodes_trace],
    Layout(
        hovermode="closest",
        title="Network Graph made with Julia",
        titlefont_size=16,
        showlegend=false,
        showarrow=false,
        xaxis=attr(showgrid=false, zeroline=false, showticklabels=false),
        yaxis=attr(showgrid=false, zeroline=false, showticklabels=false)
    )
)
