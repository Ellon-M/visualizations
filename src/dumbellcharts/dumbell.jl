# Pkg.add("DataFrames")
# Pkg.add("Dates")
Pkg.add("CSV")

using PlotlyJS, DataFrames, CSV, Dates
function dumbell()
    # reference: https://plot.ly/r/dumbbell-plots/
    # read Data into dataframe
    nm = tempname()
    url = "https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv"
    download(url, nm)
    df = CSV.read(nm, DataFrame)
    rm(nm)

    df = sort(df, :Men, rev=false)

    men = PlotlyJS.scatter(;y=df[:School], x=df[:Men], mode="markers", name="Men",
                   marker=attr(color="blue", size=12))
    women = PlotlyJS.scatter(;y=df[:School], x=df[:Women], mode="markers", name="Women",
                     marker=attr(color="pink", size=12))

    lines = map(eachrow(df)) do r
        PlotlyJS.scatter(y=fill(r[:School], 2), x=[r[:Women], r[:Men]], mode="lines",
                name=r[:School], showlegend=false, line_color="gray")
    end

    data = Base.typed_vcat(GenericTrace, men, women, lines)
    layout = Layout(width=650, height=650, margin_l=100, yaxis_title="School",
                    xaxis_title="Annual Salary (thousands)",
                    title="Gender earnings disparity")

    plot(data, layout)
end
dumbell()
