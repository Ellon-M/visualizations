# bubble plots


#VegaLite
using VegaLite, VegaDatasets

dataset("cars") |>
@vlplot(:point, x=:Horsepower, y=:Miles_per_Gallon, size=:Acceleration)


# pyplot

using PyPlot

x = 100*rand(70)
y = 100*rand(70)
areas = 2000*rand(70)


fig = figure("pyplot_scatterplot",figsize=(10,10))
ax = PyPlot.axes()
PyPlot.scatter(x,y,s=areas,alpha=0.7, c=:pink)

xlabel("X")
ylabel("Y")
PyPlot.grid("on")
