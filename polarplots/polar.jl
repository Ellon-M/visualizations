# polar plots


#JL Plots
using Plots

r(θ) = 1 + cos(θ) * sin(θ)^2
Plots.plot(r, 0, 2π, proj=:polar, lims=(0,1.5))

r(θ) = 1 + cos(θ) * sin(θ)^2
θ = range(0, stop=2π, length=50)
Plots.plot(θ, r.(θ), proj=:polar, lims=(0,1.5), c=:steelblue,  linewidth=2)


# Polar with markers

Θ = range(0, stop = 2π, length = 100)
pr = abs.(0.1 * randn(100) + sin.(3Θ))
Plots.plot(Θ, pr, proj = :polar, m = 2, c=:steelblue,  linewidth=2)


