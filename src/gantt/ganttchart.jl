# gantt chart

# VegaLite

using VegaLite

@vlplot(
    :bar,
    data={
        values=[
            {task="A",start=1,stop=3},
            {task="B",start=3,stop=8},
            {task="C",start=8,stop=10}
        ]
    },
    y="task:o",
    x="start:q",
    x2="stop:q"
)
