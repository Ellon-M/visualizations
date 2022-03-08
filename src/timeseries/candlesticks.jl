# candlesticks


# Makie
# Pkg.add("MarketData")
using CairoMakie, Random, TimeSeries, MarketData, Dates
let
    tempo = string.(timestamp(MarketData.ohlc))
    lentime = length(tempo)
    slice_dates = range(1,lentime, step = lentime÷20)

    colors = values(MarketData.ohlc.Close) .> values(MarketData.ohlc.Open)
    lowV = values(MarketData.ohlc.Low)
    highV = values(MarketData.ohlc.High)
    linesegs = []
    for i in 1:lentime
        push!(linesegs, CairoMakie.Point2f0(i, lowV[i]))
        push!(linesegs, CairoMakie.Point2f0(i, highV[i]))
    end
    linesegs = CairoMakie.Point2f0.(linesegs)
    cmap = ("#f64325", "#78f518")

    fig = Figure(resolution = (1200, 700), font = "sans", fontsize = 20)
    ax = Axis(fig, backgroundcolor = :black, ygridcolor = "#65866b",
        xgridcolor = "#65866b", xgridstyle=:dash, ygridstyle=:dash)
    barplot!(ax, 1:lentime, values(MarketData.ohlc.Open), fillto = values(MarketData.ohlc.Close),
        color = colors,strokewidth = 0.5, strokecolor = colors, colormap = cmap)
    linesegments!(ax, linesegs, color = colors, colormap = cmap)
    CairoMakie.xlims!(ax, 200, 300)
    CairoMakie.ylims!(ax, 13,24)
    ax.xticks = (slice_dates, tempo[slice_dates])
    ax.xticklabelrotation = π/4
    fig[1,1] = ax
    fig
end
