# bands


using CairoMakie

f = Figure(resolution = (600, 400), backgroundcolor = :honeydew,)
Axis(f[1, 1])

xs = 1:0.2:10
ys_low = -0.2 .* sin.(xs) .- 0.25
ys_high = 0.2 .* sin.(xs) .+ 0.25

band!(xs, ys_low, ys_high, color=:maroon1)
band!(xs, ys_low .- 1, ys_high .-1, color = :purple1)




# bands ribbon

let
    x = LinRange(-10, 10, 200)
    fig = Figure(resolution = (600, 400))
    ax = Axis(fig[1, 1], xlabel = "x", ylabel = "y")
    band!(x, sin.(x), sin.(x) .+ 1; color = (:cadetblue2, 0.4))
    band!(x, cos.(x), 1 .+ cos.(x); color = (:red, 0.2))
    display(fig)
end;



