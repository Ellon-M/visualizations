
# f(x) = x^2 - 2x + 2

using LaTeXStrings, Measures
gr()


xf(x) = x^2 - 2x + 2


Plots.plot(xf,
    -3, 3,
    marker=:circle,
    c=:darkorange3,
    linewidth= 2,
    xlabel=L"n",
    ylabel=L"F_n",
    annotation=(2, 10, L"F_n = x^2 - 2x + 2"))
