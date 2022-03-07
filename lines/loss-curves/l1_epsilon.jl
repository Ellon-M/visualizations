# L1EpsilonInsLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(L1EpsilonInsLoss(1.5), c=:olive, linewidth=2, annotation=(0, 1.1, L"L\left( r \right) = max\{0, |r| - \epsilon \}", 15))
Plots.plot!(L1EpsilonInsLoss(1), c=:orangered4, linewidth=2.5)
Plots.plot!(L1EpsilonInsLoss(.5), c=:springgreen4, linewidth=2.5)


