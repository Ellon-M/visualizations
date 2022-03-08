# Jl Plots

# - Plots
x = ["Nerds","Hackers","Scientists"]
y = [0.4,0.35,0.25]
Plots.pie(x, y, title="The Julia Community",l = 0.5)



# Pie - makie

using CairoMakie

f, ax, plt = CairoMakie.pie([π/2, 2π/3, π/4],
                normalize=false,
                offset = π/2,
                color = [:orange, :purple, :green],
                axis = (autolimitaspect = 1,),
                )



