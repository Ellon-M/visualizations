# HuberLoss
using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(HuberLoss(1.5), c=:olive, linewidth=2)
Plots.plot!(HuberLoss(1), c=:orangered4, linewidth=2.5)
Plots.plot!(HuberLoss(.5), c=:springgreen4, linewidth=2.5)


