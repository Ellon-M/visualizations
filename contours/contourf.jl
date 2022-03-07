# filled contours (contourf)

using CairoMakie

xs = LinRange(0, 10, 100)
ys = LinRange(0, 10, 100)
zs = [cos(x) * sin(y) for x in xs, y in ys]

f = Figure()
Axis(f[1, 1])

co = CairoMakie.contourf!(xs, ys, zs, levels = 10, colormap = :flag_ar)

Colorbar(f[1, 2], co)
