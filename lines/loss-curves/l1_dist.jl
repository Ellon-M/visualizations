#L1DistLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

l1fn = "L(r)=r"
l1dist = latexify(l1fn)
Plots.plot(L1DistLoss(), c=:olive, linewidth=2, annotation=(1.5, .4, L"L\left( r \right) = |r|", 18))
