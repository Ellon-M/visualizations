# parallel coordinates

#VegaLite
using VegaLite, VegaDatasets

dataset("iris") |>
@vlplot(
    width=600,
    height=300,
    config={
        axisX={domain=false, labelAngle=0, tickColor="#ccc", "title"=nothing},
        view={stroke=nothing},
        style={
            label={baseline="middle", align="right", dx=-5},
            tick={orient="horizontal"}
        }
    },
    transform=[
        { window=[{op="count", as="index" }] },
        {fold=["petalLength", "petalWidth", "sepalLength", "sepalWidth"]},
        {
            joinaggregate=[
                {op="min",field="value",as="min"},
                {op="max",field="value",as="max"}
            ],
            groupby=["key"]
        },
        {
            calculate="(datum.value - datum.min) / (datum.max-datum.min)",
            as="norm_val"
        },
        {
            calculate="(datum.min + datum.max) / 2",
            as="mid"
        },
        {
            calculate="'petalLength: '+datum.petalLength+', '+'petalWidth: '+datum.petalWidth+', sepalLength: '+datum.sepalLength+', '+'sepalWidth: '+datum.sepalWidth",
            as="tt"
        } #How to add a line break?
    ]
) +
@vlplot(
    mark={:rule,color="#ccc"},
    detail={aggregate="count",type="quantitative"},
    x="key:n"
) +
@vlplot(
    mark=:line,
    color={field="species",type="nominal"},
    detail={field="index",type="nominal"},
    opacity={value=0.3},
    x="key:n",
    y={"norm_val:q",axis=nothing},
    tooltip={"tt:n"}
)  +
@vlplot(
    mark={:text,style="label"},
    text={aggregate="max",field="max",type="quantitative"},
    x="key:n",
    y={value=0}
)  +
@vlplot(
    mark={:tick,style="tick",size=8,color="#ccc"},
    x="key:n",
    y={value=0}
)  +
@vlplot(
    mark={:text,style="label"},
    text={aggregate="min",field="mid",type="quantitative"},
    x="key:n",
    y={value=150}
)  +
@vlplot(
    mark={:tick,style="tick",size=8,color="#ccc"},
    x="key:n",
    y={value=150}
)  +
@vlplot(
    mark={:text,style="label"},
    text={aggregate="min",field="min",type="quantitative"},
    x="key:n",
    y={value=300}
)  +
@vlplot(
    mark={:tick,style="tick",size=8,color="#ccc"},
    x="key:n",
    y={value=300}
)
