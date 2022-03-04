# KDE plot

Pkg.add("Gadfly")
using KernelDensityEstimate, KernelDensityEstimatePlotting

p100 = kde!([randn(50);10.0.+2*randn(50)])
p2 = kde!([0.0;10.0],[1.0]) 
p75 = resample(p2,75)

plot([p100;p2;p75],c=["red";"green";"blue"])


