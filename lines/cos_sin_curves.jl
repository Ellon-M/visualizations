# sin (θ) cos (θ)


#Makie
using CairoMakie
let
    x = -2π:0.1:2π
    fig = Figure(resolution = (600, 400), backgroundcolor = :honeydew,
          font = "CMU Serif")
    ax = Axis(fig[1, 1], xlabel = L"f(x)", ylabel = L"x",
            xlabelsize = 22, ylabelsize = 22)
    lines!(x, cos.(x); linewidth = 3, linestyle = ".-", label = L"cos θ",
      color = :paleturquoise4)
    lines!(x, sin.(x); linewidth = 3, linestyle = :dot, label = L"sin θ",
      color = :springgreen)
    axislegend(; merge = true, framecolor = :mediumpurple, position = :lt)
    display(fig)
end;


#Jl Plots
p = Plots.plot([sin], zeros(0), xlims = (0, 2π), ylims = (-1, 1), c=[:black, :magenta], marker=:circle, linewidth= 2, label = "sin θ")
p = Plots.plot!([cos], zeros(0), xlims = (0, 2π), ylims = (-1, 1), c=[:cyan, :black], marker=:hexagon, linewidth= 2,  label = "cos θ")
for x = range(0, stop = 2π, length = 20)
    push!(p, x, Float64[sin(x), cos(x)])
end

