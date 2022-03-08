# random n-gons
Pkg.add("Colors")
using Luxor, Colors

@png begin
    Drawing(1200, 1400)

    origin()
    cols = diverging_palette(150, 210, 20)
    background(cols[1])
    setopacity(0.7)
    setline(2)

    # circumradius of 500
    ngon(0, 0, 300, 8, 0, :clip)

    for y in -500:50:500
        for x in -500:50:500
            setcolor(cols[rand(1:20)])
            ngon(x, y, rand(20:25), rand(3:12), 0, :fill)
            setcolor(cols[rand(1:20)])
            ngon(x, y, rand(10:20), rand(3:12), 0, :stroke)
        end
    end
end
