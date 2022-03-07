# roseplot


#JL Plots
using Random, Plots
Random.seed!(2018)

n = 24
R = rand(n+1)
θ = 0:2pi/n:2pi
Plots.plot(θ, R, proj=:polar, line=:steppre, lims=(0,1), c=:steelblue, linewidth=2)
