# Combined Boxplot and ViolinPlot



#JL Plots
using StatsPlots
# Pkg.add("RDatasets")
import RDatasets
singers = RDatasets.dataset("lattice", "singer")
@df singers Plots.violin(:VoicePart, :Height, line = 0, fill = (0.2, :blue))
@df singers Plots.boxplot!(:VoicePart, :Height, line = (2, :black), fill = (0.3, :orange))
