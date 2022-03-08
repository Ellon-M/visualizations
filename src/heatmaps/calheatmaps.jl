# Heatmaps with date-time-axis

begin
    using Dates
    z = rand(5, 5)
    x = DateTime.(2016:2020)
    y = 1:5
    heatmap(x, y, z)
end
