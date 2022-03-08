# scatterlines


# Makie
using CairoMakie

f = Figure()
Axis(f[1, 1])

xs = LinRange(0, 10, 20)
ys = 0.5 .* sin.(xs)

CairoMakie.scatterlines!(xs, ys, color = :red)
CairoMakie.scatterlines!(xs, ys .- 1, color = xs, markercolor = :olive)
CairoMakie.scatterlines!(xs, ys .- 2, color= xs, markercolor = :mediumorchid, markersize = LinRange(5, 30, 20))
CairoMakie.scatterlines!(xs, ys .- 3, marker = :cross, strokewidth = 1,
    markersize = 20, color = :orange, strokecolor = :black)
