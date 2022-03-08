# b-splines


using Plots, LaTeXStrings 

function b_spline_basis(i,r,t,u)
    u_i = u[i+1]
    u_i1 = u[i+2]
    u_ir = u[i+r+1]
    u_i1r = u[i+r+2]

    if r == 0 
        if u_i <= t <= u_i1
            return 1
        else 
            return 0
        end
    else
        N = b_spline_basis
        left = 0
        if (u_ir-u_i) != 0
            left = (t-u_i)/(u_ir-u_i) * N(i,r-1,t,u)
        end

        right = 0
        if (u_i1r-u_i1) != 0
            right = (u_i1r-t)/(u_i1r-u_i1) * N(i+1,r-1,t,u)
        end
        return left + right 
    end
end


function b_spline(dBx,dBy, n, knot_vector; steps=200)
    m = length(dBx)-1
    if length(knot_vector) != m+1+n+1
        println("The knot vector has the wrong length it should have m+1+n+1 = ", m+1+n+1, " components.")
        println("But it has ", length(knot_vector), " components")
        return
    end
    plot(;size=(700,500), axisratio=:equal, legend=false)
    u_min = knot_vector[1]
    u_max = knot_vector[end]
    step_size = (u_max-u_min)/(steps-1)
   
    curve = zeros(steps,2)
    N = (i,r,t)->b_spline_basis(i,r,t,knot_vector)
    c = 1
    for t=u_min:step_size:u_max
        pos = zeros(2)
        for i=0:m
            if knot_vector[i+1] != knot_vector[i+1+n]
                pos = pos .+ [dBx[i+1],dBy[i+1]].*N(i,n,t)
            end
        end
        curve[c,:] .= pos
        c += 1
    end
    plot!(curve[:,1],curve[:,2])
    plot!(dBx,dBy, linetype=:scatter, color=:springgreen)
    plot!(dBx,dBy, color=:springgreen)
    for i in 0:length(dBx)-1
        annotate!(dBx[i+1]+0.2,dBy[i+1]+0.35, latexstring("d_"*string(i)))
    end

    png("b_spline")
end


dBx = [0.0,-1,5,7, 9,13]
dBy = [0.0, 3,5,4,-2, 1]
@time b_spline(dBx, dBy, 2, [0,0,0,1,2,3,4,4,4])
