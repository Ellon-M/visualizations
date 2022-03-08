#LogitMarginLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(LogitMarginLoss(), c=:olive, leg=:topright, linewidth=2, annotation=(1, 1.5, L"L\left( a \right) = ln(1+e^{-a})", 18))


