# logbeta
using CairoMakie, LaTeXStrings, SpecialFunctions
let
    x = 0.1:0.1:15
    cycle = Cycle([:color, :linestyle, :marker], covary = true)
    set_theme!(Lines = (cycle = cycle,), Scatter = (cycle = cycle,))
    fig = Figure(resolution = (600, 400), font = "CMU Serif", backgroundcolor = :honeydew) # probably you need to install this font in your system
    ax = Axis(fig[1, 1], xlabel = L"x", ylabel = L"Y_{\nu}(x)", ylabelsize = 22,
        xlabelsize = 22, xgridstyle = :dash, ygridstyle = :dash, xtickalign = 1,
        xticksize = 10, ytickalign = 1, yticksize = 10, xlabelpadding = -10)
    for ν in 0:4
        CairoMakie.lines!(ax, x, logbeta.(ν, x), label = latexstring("Y_{$(ν)}(x)"), linewidth = 3)
    end
    axislegend(; position = :rb, nbanks = 2, framecolor = (:grey, 0.5))
    CairoMakie.ylims!(2.5, -10)
    display(fig)
end;


