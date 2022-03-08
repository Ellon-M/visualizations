# Population pyramids

# Vegalite

using VegaLite, VegaDatasets

dataset("population") |>
@vlplot(
    width=300,
    height=200,
    :bar,
    transform=[
        {filter="datum.year==2000"},
        {calculate="datum.sex==2 ? 'Female' : 'Male'", as="gender"},
        {calculate="datum.sex==2 ? -datum.people : datum.people", "as"="signed_people" }
    ],
    x={"sum(signed_people)", axis={title="population", format=:s} },
    y={"age:o", axis=nothing, sort="descending" },
    color={"gender:n", scale={range=["#675193", "#ca8861"]},legend={orient=:top,title=nothing}},
    config={view={stroke=nothing},axis={grid=false}}
)
