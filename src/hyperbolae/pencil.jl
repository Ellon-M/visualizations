#Pkg.add("HyperbolicPlane")
  
using HyperbolicPlane, Plots

"""
`pencil(s::Real, nlines::Int, ncycles::Int)` draws a pencil of `nlines`
lines with common ideal point `exp(im*s)` and `ncycles` Horocycles that
are orthogonal to those lines.
"""
function pencil(s::Real=1, nlines::Int=5, ncycles::Int=5)
    Plots.plot()

    # draw a pencil of lines
    tlist = [ 2*pi*k/(nlines+1) for k=1:nlines ]
    for t in tlist
        L = HLine(s, s+t)
        set_color(L,:navyblue)
        draw(L)
    end

    # draw a pencil of horocycles
    xlist = [ 2*t/(ncycles+1) - 1 for t in 1:ncycles]

    plist = [ HPoint(x+0im) for x in xlist ]
    f = rotation(s)
    for P in plist
        H = Horocycle(f(P), s)
        set_color(H,:royalblue)
        draw(H)
    end
    draw(HPlane())
    finish()
end


