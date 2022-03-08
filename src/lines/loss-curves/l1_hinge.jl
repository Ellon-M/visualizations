#L1HingeLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

Plots.plot(L1HingeLoss(), c=:olive, linewidth=2, annotation=(1, 1.6, L"L\left( a \right) = max\{0,1, - a \}", 18))

# smoothed 

Plots.plot(SmoothedL1HingeLoss(2), leg=:topright, c=:olive, linewidth=2)
Plots.plot!(SmoothedL1HingeLoss(1.5), c=:orangered4, linewidth=2.5)
Plots.plot!(SmoothedL1HingeLoss(1), c=:springgreen4, linewidth=2.5)
Plots.plot!(SmoothedL1HingeLoss(.5), c=:springgreen4, linewidth=2.5)
