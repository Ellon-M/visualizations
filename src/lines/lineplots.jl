# plots gr backend

using Plots
gr()

Plots.plot(Plots.fakedata(50, 5), w = 3)


# dark
Plots.plot(Plots.fakedata(100,10), pallete=cgrad.(:blues), bg_inside=:black)


# lines subplots
Plots.plot(Plots.fakedata(100, 10), layout = 4, palette = cgrad.([:algae :speed :gist_ncar :YlGn_6]), bg_inside = [:honeydew :pink :snow3 :lawngreen])


