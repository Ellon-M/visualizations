# L2 DistLoss
#Pkg.add("Latexify")

using LossFunctions
using LaTeXStrings, Measures, Latexify
gr(bg=:white)
l2fn = "L(r)=r^2"
l2dist = latexify(l2fn)
Plots.plot(L2DistLoss(), c=:olive, linewidth=2, annotation=(1, 3.3, L"L\left( r \right) = |r^{2}|", 18))
