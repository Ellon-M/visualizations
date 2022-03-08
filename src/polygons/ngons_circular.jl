
using Luxor, Colors

# n-gons
@png begin
    for i in 23:-1:3
        sethue(i/20, 0.7, .99)
        ngonside(O, 75, i, 0, :fill)
        sethue("navy")
        ngonside(O, 75, i, 0, :stroke)
    end
end



