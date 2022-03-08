# offsetting polygons


Using Luxor

@png begin 
    background("aliceblue")
    p = star(O, 45, 5, 0.5, 0, vertices=true)
    setline(5)
    sethue("midnightblue")
    setdash("dotdotdashed")
    Luxor.poly(p, :stroke, close=true)
    setdash("solid")
    sethue("deeppink4")
    
    setline(2)
    Luxor.poly(offsetpoly(p, 40), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 45), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 50), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 55), :stroke, close=true)

    sethue("darkcyan")
    
    Luxor.poly(offsetpoly(p, 30), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 35), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 40), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 45), :stroke, close=true)

    sethue("tan")
    
    setline(1)
    Luxor.poly(offsetpoly(p, 30), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 25), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 30), :stroke, close=true)
    Luxor.poly(offsetpoly(p, 35), :stroke, close=true)

    sethue("deepskyblue4")

    Luxor.poly(offsetpoly(p, -10), :stroke, close=true)
    Luxor.poly(offsetpoly(p, -15), :stroke, close=true)
    Luxor.poly(offsetpoly(p, -20), :stroke, close=true)
end
