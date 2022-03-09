import Pkg
Pkg.add("Conda")
using Conda
Conda.pip_interop(true)
Conda.pip("install", "webio_jupyter_extension")
using PlotlyJS

function batman()
    # reference: https://github.com/alanedelman/18.337_2015/blob/master/Lecture01_0909/The%20Bat%20Curve.ipynb
    σ(x) = @. √(1-x.^2)
    el(x) = @. 3*σ(x/7)
    s(x) = @. 4.2 - 0.5*x - 2.0*σ(0.5*x-0.5)
    b(x) = @. σ(abs(2-x)-1) - x.^2/11 + 0.5x - 3
    c(x) = [1.7, 1.7, 2.6, 0.9]

    p(i, f; kwargs...) = PlotlyJS.scatter(;x=[-i; 0.0; i], y=[f(i); NaN; f(i)],
                                  marker_color="black", showlegend=false,
                                  kwargs...)
    traces = vcat(p(3:0.1:7, el; name="wings 1"),
                  p(4:0.1:7, t->-el(t); name="wings 2"),
                  p(1:0.1:3, s; name="Shoulders"),
                  p(0:0.1:4, b; name="Bottom"),
                  p([0, 0.5, 0.8, 1], c; name="head"))

    PlotlyJS.plot(traces, Layout(title="Batman"))
end
batman()
