# Donut chart w/ VegaLite

using VegaLite, DataFrames

df = DataFrame(category=1:6, value=[4,6,10,3,7,8])

df |> @vlplot(mark={:arc, innerRadius=50}, theta=:value, color="category:n", view={stroke=nothing})
