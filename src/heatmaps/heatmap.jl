# heatmaps

# Plots
import Pkg
Pkg.add("Plots")
Pkg.add("PyPlot")
using Plots

using Random
Random.seed!(2018)

a = rand(5,5)
xlabel = string.(collect('A':'E'))
ylabel = string.(collect('a':'e'))
Plots.heatmap(a, xticks=(1:5, xlabel), yticks=(1:5, ylabel),
    fill_z=a, aspect_ratio=:equal)

fontsize = 15
nrow, ncol = size(a)
ann = [(i,j, Plots.text(round(a[i,j], digits=2), fontsize, :white, :center))
            for i in 1:nrow for j in 1:ncol]
annotate!(ann, linecolor=:white)



# makie
using Random

let
    Random.seed!(123)
    fig = Figure(resolution = (600, 400))
    ax = Axis(fig[1, 1]; xlabel = "x", ylabel = "y")
    hmap = heatmap!(2rand(20, 20) .- 1; colormap = :RdPu_9)
    Colorbar(fig[1, 2], hmap; label = "values", width = 15, ticksize = 15, tickalign = 1)
    colsize!(fig.layout, 1, Aspect(1, 1.0))
    colgap!(fig.layout, 7)
    display(fig)
end;


# gadfly
using Gadfly

parameters = ["ξ₁", "η₁",  "ξ₂", "η₂"]
palettef = Scale.lab_gradient("darkgreen", "orange", "blue")

Gadfly.spy(rand(4,4), Scale.y_discrete(labels = i->parameters[i]), Scale.x_discrete,
Guide.ylabel("Parameters"), Guide.xlabel("Mode"), Scale.color_continuous(colormap=palettef, minvalue=0, maxvalue=1.5))



