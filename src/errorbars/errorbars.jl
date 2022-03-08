# error bars

#makie

using CairoMakie

f = Figure()
Axis(f[1, 1])

xs = 0:0.5:10
ys = 0.5 .* sin.(xs)

lowerrors = fill(0.1, length(xs))
higherrors = LinRange(0.1, 0.4, length(xs))

errorbars!(xs, ys, lowerrors, higherrors,
    color = range(0, 1, length = length(xs)),
    whiskerwidth = 10, linewidth=2, colormap = :tableau_hue_circle)

# plot position scatters so low and high errors can be discriminated
CairoMakie.scatter!(xs, ys, markersize = 4, color = :black)
