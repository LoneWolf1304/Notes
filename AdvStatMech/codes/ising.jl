using Random, Plots

# --- Ising MCMC Simulation (Metropolis) ---
function ising_mcmc(N, T, steps)
    # initialize spins randomly as ±1
    spins = rand([-1, 1], N, N)

    for _ in 1:steps
        i, j = rand(1:N), rand(1:N)

        # periodic boundary neighbors
        up    = spins[mod1(i-1,N), j]
        down  = spins[mod1(i+1,N), j]
        left  = spins[i, mod1(j-1,N)]
        right = spins[i, mod1(j+1,N)]

        dE = 2 * spins[i,j] * (up + down + left + right)

        # Metropolis update
        if dE < 0 || rand() < exp(-dE/T)
            spins[i,j] *= -1
        end
    end

    return spins
end

# --- Run Sim ---
N = 200              # lattice size
T = 0.8             # temperature
steps = 200000      # MCMC sweeps

spins = ising_mcmc(N, T, steps)

# --- Plot configuration (black & white heatmap) ---
heatmap(spins,
        color=:grays, aspect_ratio=1,
        axis=nothing, ticks=nothing, border=:none, colorbar=false)

savefig("ising1.svg")
println("Saved image: ising_config_T$(T).png")
