# quiver

#JL Plots
Using Plots
n = 7
qf(x,y) = 1 / hypot(x, y)
x = repeat(-3:(2*3)/n:3, 1, n) |> vec
y = repeat(-3:(2*3)/n:3, 1, n)' |> vec
vx = qf.(x,y) .* cos.(atan.(y,x)) |> vec
vy = qf.(x,y) .* sin.(atan.(y,x)) |> vec

Plots.quiver(x, y, quiver=(vx, vy), aspect_ratio=:equal, c=:steelblue, linewidth=2)
