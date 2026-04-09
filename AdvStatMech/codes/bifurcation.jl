using Plots, LaTeXStrings

using Plots
μ_vals = range(0, 4, length=2000)
n_transient = 1000
n_plot = 200

x0 = 0.5

μ_plot = Float64[]
x_plot = Float64[]

for μ in μ_vals
    x = x0
    
    # transient
    for i in 1:n_transient
        x = μ * x * (1 - x)
    end
    
    # collect data
    for i in 1:n_plot
        x = μ * x * (1 - x)
        push!(μ_plot, μ)
        push!(x_plot, x)
    end
end
fixpt(x) = (1-1/x)
scatter(μ_plot, x_plot, ms=0.2, color=:black, legend=false,
        xlabel=L"\mu", title="", ylabel=L"x", labelfontsize=18, tickfontsize=14)
μ_vals1 = range(1, 3, length=50)

plot!(μ_vals1, fixpt.(μ_vals1), c="red")

BB = bbox(0.13,0.1,
0.35,0.38)



μ_vals = range(2.89, 4, length=500)
n_transient = 1000
n_plot = 200

x0 = 0.5

μ_plot = Float64[]
x_plot = Float64[]

for μ in μ_vals
    x = x0
    
    # transient
    for i in 1:n_transient
        x = μ * x * (1 - x)
    end
    
    # collect data
    for i in 1:n_plot
        x = μ * x * (1 - x)
        push!(μ_plot, μ)
        push!(x_plot, x)
    end
end
fixpt(x) = (1-1/x)
scatter!(μ_plot, x_plot, ms=0.2, color=:black, legend=false,
        xlabel=L"\mu", title="", ylabel=L"x",inset = (1, BB),
subplot = 2)
plot!(dpi=1000)

savefig("logistic_orbit.png")