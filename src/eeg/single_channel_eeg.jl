# single channel EEG

using Neuroimaging, DataDeps

data_path = joinpath(
    datadep"ExampleSSR",
    "Neuroimaging.jl-example-data-master",
    "neuroimaingSSR.bdf",
)

s = read_EEG(data_path)

plot(s, "F6")
