using HyperbolicPlane, Plots

"""
`star_david(rad=1)` draw a Star of David in the hyperbolic plane.
"""
function star_david(r::Real = 1.0)
    tlist = [pi/2   pi/2+2pi/3   pi/2+4pi/3]
    points = [ HPoint(r,t) for t in tlist]
    T = HTriangle(points...)
    set_line_style(T,:dash)
    set_thickness(T, 1.2) 
    Plots.plot()
    draw([T,T'])
    finish()
end

star_david()
