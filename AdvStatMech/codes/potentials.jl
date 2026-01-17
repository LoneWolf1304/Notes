using Plots, LaTeXStrings
pgfplotsx()
function ljp(r)
    ϵ = 4
    σ = 1
    return ϵ*((σ/r)^12 -(σ/r)^6)
end
function london(r,R)
    if(r<R)
        return 70 
    else
        return -(R/r)^6
    end
end

r = LinRange(0.8,2.5,500)
ll = ljp.(r)
ind = argmin(ll)
plot(r, ll , label="", title="(a) LJP", xlabel=L"r", ylabel=L"u(r)")
ylims!(-1.5,1)
vline!([r[ind]], label="", c="black", ls=:dashdot,yguidefontsize=18,xguidefontsize=18)
p1 = hline!([0], label="", ls=:dash)


plot()
ll = london.(r, r[ind])
ind = argmin(ll)
plot(r, ll , label="", title="(b) London", xlabel=L"r", ylabel=L"u(r)",yguidefontsize=18,xguidefontsize=18)
ylims!(-1.5,1)
vline!([r[ind]], label="", c="black", ls=:dashdot)
p2 = hline!([0], label="", ls=:dash)
plot(p1,p2, layout=(1,2), left_margin=6Plots.mm, bottom_margin=6Plots.mm, size = (1200, 500))
savefig("../pics/interactions.pdf")
