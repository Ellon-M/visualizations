# L2EpsilonLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(L2EpsilonInsLoss(1.5), c=:olive, linewidth=2, annotation=(0, 1.5, L"L\left( r \right) = max\{0, |r| - \epsilon \}^2", 15))
Plots.plot!(L2EpsilonInsLoss(1), c=:orangered4, linewidth=2.5)
Plots.plot!(L2EpsilonInsLoss(.5), c=:springgreen4, linewidth=2.5)


