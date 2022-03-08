# area plots

# Vega
using Vega, KernelDensity, Distributions

x = rand(Beta(3.0, 2.0), 10)
k = kde(x)

areaplot(x = k.x, y = k.density)


# stacked area

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]

a = areaplot(x = x, y = y, group = g, stacked = true)

# Plotly
using PlotlyJS

x = ["Winter", "Spring", "Summer", "Fall"]

plot([
    scatter(
        x=x, y=[40, 60, 40, 10],
        stackgroup="one", mode="lines", hoverinfo="x+y",
        line=attr(width=0.5, color="rgb(131, 90, 241)")
    ),
    scatter(
        x=x, y=[20, 10, 10, 60],
        stackgroup="one", mode="lines", hoverinfo="x+y",
        line=attr(width=0.5, color="rgb(111, 231, 219)")
    ),
    scatter(
        x=x, y=[40, 30, 50, 30],
        stackgroup="one", mode="lines", hoverinfo="x+y",
        line=attr(width=0.5, color="rgb(184, 247, 2121)")
    ),
], Layout(yaxis_range=(0, 100)))

