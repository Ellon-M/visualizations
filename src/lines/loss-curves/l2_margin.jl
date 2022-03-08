#L2MarginLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(L2MarginLoss(), leg=:topright, c=:olive, linewidth=2.5, annotation=(1,5,L"L\left( a \right) = (1 - a)^2", 16))
