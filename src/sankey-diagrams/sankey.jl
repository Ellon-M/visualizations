#Pkg.add("SankeyPlots")
using SankeyPlots

src = [1, 1, 1, 1, 2, 2, 2, 3, 4, 5]
dst = [6, 3, 7, 4, 3, 7, 4, 7, 8, 8]
weights = [0.1, 0.3, 0.5, 0.5, 0.2, 2.8, 1, 0.45, 4.5, 3.3]

SankeyPlots.sankey(src, dst, weights)


# 2

names = [
    "PV",
    "Electricity Buy",
    "Battery",
    "Heat pump",
    "Biomass",
    "Electricity Sell",
    "Electricity Demand",
    "Heat demand",
]
energy_colors = SankeyPlots.palette(:seaborn_colorblind)[[9, 10, 3, 5, 2, 8, 1, 4]]

SankeyPlots.sankey(
    src, dst, weights;
    node_labels=names,
    node_colors=energy_colors,
    edge_color=:gradient,
    label_position=:bottom,
    label_size=7,
    compact=true,
)
