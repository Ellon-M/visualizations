# boxplots w/ outliers

# Makie

using CairoMakie

xs = rand(1:3, 1000)
ys = randn(1000)
dodge = rand(1:2, 1000)

CairoMakie.boxplot(xs, ys, dodge = dodge, show_notch = true, color = dodgeb)



# Jl Plots

using StatsPlots
gr(leg = false, bg = :honeydew)
Plots.plot()
Plots.plot(Plots.boxplot!(rand(1:4, 1000), randn(1000), color=:green))
