# bernstein basis


using Plots
# for the LaTeX labels in the legend
using LaTeXStrings 

function compute_bernstein(i,n; steps=100)
    return [binomial(n,i)*t^i*(1-t)^(n-i) for t in LinRange(0,1,steps)]
end

function compute_bernstein_poly(px,py; steps=100)
    n = length(px)-1
    bernsteins = [compute_bernstein(i,n) for i=0:n]
    x_vals = [sum(px[k]*bernsteins[k][t] for k=1:n+1) for t=1:steps]
    y_vals = [sum(py[k]*bernsteins[k][t] for k=1:n+1) for t=1:steps]
    return x_vals, y_vals
end


function plot_bernstein_poly()
    bernsteins = [compute_bernstein(i,2) for i=0:n]
    plot(bernsteins, leg=false)
    png("bernsteins")
end

function plot_with_bernstein(px,py; steps=100, subplot=1)
    x_vals, y_vals = compute_bernstein_poly(px,py; steps=steps)
    plot!(x_vals, y_vals, color=:blue, label="",subplot=subplot)
end

function main()
    px = [0, 3, 7]
    py = [2, 9, 3]

    plot(;size=(700,500), axisratio=:equal, legendfont=font(13))
    plot!(px, py, linetype=:scatter, label="control points")
    plot_with_bernstein(px,py)
    png("using_bernstein")
end
