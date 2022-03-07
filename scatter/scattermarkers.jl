# scatter markers

#Jl Plots
using Plots

markers = filter((m->begin
                m in Plots.supported_markers()
            end), Plots._shape_keys)
markers = permutedims(markers)
n = length(markers)
x = (range(0, stop = 12, length = n + 2))[2:end - 1]
y = repeat(reshape(reverse(x), 1, :), n, 1)
Plots.scatter(x, y, m = markers, markersize = 6, lab = map(string, markers), bg = :honeydew, xlim = (0, 12), ylim = (0, 12))



# makie markers

using CairoMakie

markers_labels = [
    (:rect, ":rect"),
    (:star5, ":star5"),
    (:diamond, ":diamond"),
    (:hexagon, ":hexagon"),
    (:cross, ":cross"),
    (:xcross, ":xcross"),
    (:utriangle, ":utriangle"),
    (:dtriangle, ":dtriangle"),
    (:ltriangle, ":ltriangle"),
    (:rtriangle, ":rtriangle"),
    (:pentagon, ":pentagon"),
    (:star4, ":star4"),
    (:star8, ":star8"),
    (:vline, ":vline"),
    (:hline, ":hline"),
    (:x, ":x"),
    (:+, ":+"),
    (:circle, ":circle"),
    ('a', "'a'"),
    ('B', "'B'"),
    ('↑', "'\\uparrow'"),
    ('😄', "'\\:smile:'"),
    ('✈', "'\\:airplane:'"),
]

f = Figure()
ax = Axis(f[1, 1], yreversed = true,
    xautolimitmargin = (0.15, 0.15),
    yautolimitmargin = (0.15, 0.15)
)

for (i, (marker, label)) in enumerate(markers_labels)
    p = Point2f(fldmod1(i, 6)...)

    CairoMakie.scatter!(p, marker = marker, markersize = 20, color = :black)
    text!(label, position = p, color = :gray70, offset = (0, 20),
        align = (:center, :bottom))
end

