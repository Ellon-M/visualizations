# stacked area plot

# Vegalite

using VegaLite, VegaDatasets

dataset("unemployment-across-industries") |>
@vlplot(
    :area,
    width=300, hieght=200,
    x={
        "yearmonth(date)",
        axis={format="%Y"}
    },
    y="sum(count)",
    color={
        :series,
        scale={scheme="category20b"}
    }
)
