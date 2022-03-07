# phylotrees


# Plots

Pkg.add("PhyloTrees")
Pkg.add("StatsBase")
using PhyloTrees, Plots, StatsBase

g = Tree()
addnode!(g)
for i = 1:100
  branch!(g, sample(collect(keys(g.nodes))), 10*rand())
end
Plots.plot(g, dpi=200, c=:yellow)
png(joinpath(@__DIR__, "treeplot.png"))
