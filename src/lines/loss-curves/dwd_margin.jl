#DWDMarginLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(DWDMarginLoss(1.5), leg=:topright, c=:orangered4, linewidth=2.5)
Plots.plot!(DWDMarginLoss(1), c=:springgreen4, linewidth=2.5)
Plots.plot!(DWDMarginLoss(.5), c=:springgreen4, linewidth=2.5)


