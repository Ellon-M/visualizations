#L2HingeLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(L2HingeLoss(), c=:olive, leg=:topright, linewidth=2, annotation=(1, 6, L"L\left( a \right) = max\{0,1, - a \}^2", 18))


