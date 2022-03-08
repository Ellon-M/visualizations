# makie
using CairoMakie
let
    x = 1:10
    fig = Figure(resolution = (600, 400), backgroundcolor = :honeydew,
          font = "CMU Serif")
    ax = Axis(fig[1, 1], xlabel = L"x", ylabel = L"x^2",
            xlabelsize = 22, ylabelsize = 22)
    lines!(x, x .^ 2; linewidth = 2, linestyle = ".-", label = L"x^2",
      color = :black)
    limits!(0, 10, 0, 100)
    axislegend(; merge = true, framecolor = :mediumpurple, position = :lt)
    current_figure()
    display(fig)
end;


