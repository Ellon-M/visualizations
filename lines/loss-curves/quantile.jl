# QuantileLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(QuantileLoss(.75), c=:olive, linewidth=2)
Plots.plot!(QuantileLoss(.5), c=:orangered4, linewidth=2.5)
Plots.plot!(QuantileLoss(.25), c=:springgreen4, linewidth=2.5)


