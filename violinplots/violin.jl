# violin


#Jl Plots

using Plots

y = rand(100, 4) # Four series of 100 points each

Plots.violin(["Series 1" "Series 2" "Series 3" "Series 4"], y, alpha=.7, leg = false)


