# radial plot

using VegaLite

@vlplot(
    data={values=[12, 23, 47, 6, 52, 19]},
    theta={:data, stack=true},
    radius={:data, scale={type=:sqrt, zero=true, range=[20,100]}},
    color={"data:n", legend=nothing},
    view={stroke=nothing}
) +
@vlplot(mark={:arc, innerRadius=20, stroke="#fff"}) +
@vlplot(mark={:text, radiusOffset=10}, text=:data)
