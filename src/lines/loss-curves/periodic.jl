# PeriodicLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(PeriodicLoss(1.5), leg=:outertopright, c=:olive, linewidth=2, legendtitle= L"L\left( r \right) = 1 - cos(\frac {2r\pi}{c})", size=(850,499))
Plots.plot!(PeriodicLoss(1), c=:orangered4, linewidth=2.5)
Plots.plot!(PeriodicLoss(.5), c=:springgreen4, linewidth=2.5)



