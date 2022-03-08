# normalized stacked area chart


# Vegalite
using VegaLite, VegaDatasets

dataset("unemployment-across-industries") |>
@vlplot(
    :area,
    width=300, height=200,
    x={
        "yearmonth(date)",
        axis={
            domain=false,
            format="%Y"
        }
    },
    y={
        "sum(count)",
        axis=nothing,
        stack=:normalize
    },
    color={
        :series,
        scale={scheme="category20b"}
    }
)
