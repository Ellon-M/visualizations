#Hypotrochoid

using Luxor

@png begin
    origin()
    background("grey15")
    sethue("antiquewhite")
    setline(1)
    p = hypotrochoid(100, 25, 55, :stroke, stepby=0.01, vertices=true)
    for i in 0:3:15
    Luxor.poly(offsetpoly(p, i), :stroke, close=true)
    end
end


