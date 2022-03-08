using HyperbolicPlane, Plots

"""
`concentric()` draws a picture of several concentric circles.
"""
function concentric()
    Plots.plot()
    P = HPoint(1,pi/6)
    for r in 0.25:0.25:3
        C = HCircle(P,r)
        set_thickness(C, 1.5) 
        draw(C)
    end
    draw(HPlane())
    finish()
end

concentric()
