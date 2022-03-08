#LogitDistLoss

using LaTeXStrings, LossFunctions, Measures, Latexify

logitfn = "L(r)=−ln*((4e^r)/(1+e^r)^2)"
logitdist = latexify(logitfn)
print(logitdist)
Plots.plot(LogitDistLoss(), c=:olive, linewidth=2, annotation=(0.5, .75, L"\left( r \right) = \left(  - ln \right) \cdot \frac{4 \ e^{r}}{\left( 1 + e^{r} \right)^{2}}", 18))
