# empirical cumulative distribution function (ECDF)
using CairoMakie

f = Figure()
Axis(f[1, 1])

x = randn(200)
ecdfplot!(x, color = (:blue, 0.3))
ecdfplot!(x, color = :red, npoints=10)


