# Archimedian spirals
using Luxor

spiraldata = [
  (-2, "Lituus",      130),
  (-1, "Hyperbolic", 180),
  ( 1, "Archimedes",   1),
  ( 2, "Fermat",       7)]

grid = GridRect(O - (200, 0), 130, 50)
@png begin
    background("grey15")
    for aspiral in spiraldata
        @layer begin
            sethue("antiquewhite")
            setcolor(sethue("antiquewhite"))
            setline(.5)
            Luxor.translate(nextgridpoint(grid))
            spiral(last(aspiral), first(aspiral), period=20π, :stroke)
            strokepath()
            fontsize(16)
            label(aspiral[2], :S, offset=80)
        end
    end
end



