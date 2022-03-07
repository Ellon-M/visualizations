# collatz conjenture


#Jl Plots

function collatz_next(n)
    if n % 2 == 0
        return n ÷ 2
    else
        return 3n+1
    end
end

function collatz_path(n)
    steps = Vector{Int}()
    while n != 1
        push!(steps, n)
        n = collatz_next(n)
    end
    push!(steps, 1)
    return steps
end

using Plots

x = 1:10000
y = length.(collatz_path.(x))
Plots.scatter(x, y, label="Stopping time", legend=:topleft, size=(800,600))

x = 2 .^ (0:13)
y = length.(collatz_path.(x))
Plots.scatter!(x, y, color=:red, label="for powers of two")
