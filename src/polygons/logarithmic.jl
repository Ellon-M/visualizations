# logarithmic spirals

spiraldata = [
    (10,  0.05),
    (4,   0.10),
    (0.5, 0.17)]

grid = GridRect(O - (200, 0), 175, 50)
@png begin
    background("grey15")
    for aspiral in spiraldata
        @layer begin
            sethue("antiquewhite")
            setcolor(sethue("antiquewhite"))
            Luxor.translate(nextgridpoint(grid))
            setline(.5)
            spiral(first(aspiral), last(aspiral), log=true, period=10π, :stroke)
            fontsize(16)
            label(string(aspiral), :S, offset=100)
        end
    end
end


