#Exponential Loss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(ExpLoss(), c=:olive, leg=:topright, linewidth=2, annotation=(1, 1.5, L"L\left( a \right) = e^{-a}", 18))
