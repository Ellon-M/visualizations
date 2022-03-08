# smoothing polygons

Using Luxor

@png begin
    background("grey15")
   tiles = Tiler(600, 250, 1, 5, margin=10)
    for (pos, n) in tiles
        p = star(pos, tiles.tilewidth/2 - 2, 5, 0.3, 0, vertices=true)
        setdash("dot")
        sethue("white")
        prettypoly(p, close=true, :stroke)
        setdash("solid")
        sethue("antiquewhite")
        polysmooth(p, n * 2, :fill)
    end
end
