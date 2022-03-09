#SigmoidLoss

Pkg.add("Vega")

Plots.plot(SigmoidLoss(), c=:olive, leg=:topright, linewidth=2, annotation=(1, 1.5, L"L\left( a \right) = 1 - tanh(a)", 18))
