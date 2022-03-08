# AS trees

# plots
using GraphRecipes
using Plots
default(size=(700, 700))

code = :(
function mysum(list)
    out = 0
    for value in list
        out += value
    end
    out
end
)

plot(code, fontsize=12, shorten=0.01, axis_buffer=0.15, nodeshape=:rect, nodecolor=:lightgreen)



Pkg.add("AbstractTrees")

using AbstractTrees

AbstractTrees.children(d::Dict) = [p for p in d]
AbstractTrees.children(p::Pair) = AbstractTrees.children(p[2])
function AbstractTrees.printnode(io::IO, p::Pair)
    str = isempty(AbstractTrees.children(p[2])) ? string(p[1], ": ", p[2]) : string(p[1], ": ")
    print(io, str)
end

d = Dict(:a => 2,:d => Dict(:b => 4,:c => "Hello"),:e => 5.0)

using GraphRecipes
using Plots
default(size=(700, 700))

plot(TreePlot(d), method=:tree, fontsize=10, nodeshape=:ellipse)
