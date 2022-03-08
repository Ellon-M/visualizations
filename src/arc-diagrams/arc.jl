#arc diagrams


# plots
#import Pkg
#Pkg.add("LinearAlgebra")
#Pkg.add("GraphRecipes")
#Pkg.add("SparseArrays")

using LinearAlgebra
using SparseArrays
using GraphRecipes
using Plots

adjmat = Symmetric(sparse(rand(0:1,8,8)))

plot(
    graphplot(adjmat,
              method=:arcdiagram,
              markersize=0.5,
              linecolor=:black,
              markercolor=:black)
    )
