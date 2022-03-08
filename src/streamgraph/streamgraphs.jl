# streamgraph - w/ VegaLite

using VegaLite, VegaDatasets

dataset("unemployment-across-industries") |>
@vlplot(
    :area,
    width=300, height=200,
    x={
        "yearmonth(date)",
        axis={
            domain=false,
            format="%Y",
            tickSize=0
        }
    },
    y={
        "sum(count)",
        axis=nothing,
        stack=:center
    },
    color={
        :series,
        scale={scheme="category20b"}
    }
)
