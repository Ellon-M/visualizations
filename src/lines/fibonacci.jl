# fibonacci seq - LaTeX
#JL Plots


Pkg.add("LaTeXStrings")
Pkg.add("Measures")
using LaTeXStrings, Measures
gr(bg = :white)

fib = zeros(12);
for i = 1:12
    fib[i] = (((1+sqrt(5))/2)^i - ((1-sqrt(5))/2)^i)/sqrt(5);
end

Plots.plot(fib,
    marker=:circle,
    linewidth= 2,
    xlabel=L"n",
    ylabel=L"F_n",
    annotation=(5, 100, L"F_n = \frac{1}{\sqrt{5}} \left[\left( \frac{1+\sqrt{5}}{2} \right)^n - \left( \frac{1-\sqrt{5}}{2} \right)^n \right]"))
