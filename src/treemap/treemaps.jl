# treemap/boxmap

# Luxor

using Luxor

fibonacci = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

# make a boxmap and store the tiles
@png begin
    tiles = boxmap(fibonacci, Luxor.BoundingBox()[1], 600, 400)

    for (n, t) in enumerate(tiles)
        randomhue()
        bb = Luxor.BoundingBox(t)
        sethue("black")
        Luxor.box(bb - 5, :stroke)

        randomhue()
        Luxor.box(bb - 8, :fill)

        # text labels
        sethue("white")

        # rescale text to fit better
        fontsize(boxwidth(bb) > boxheight(bb) ? boxheight(bb)/4 : boxwidth(bb)/4)
        Luxor.text(string(sort(fib, rev=true)[n]),
            Luxor.midpoint(bb[1], bb[2]),
            halign=:center,
                valign=:middle)
    end
end
