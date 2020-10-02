using Plots
using Random
using Statistics

function estimate_pi(n, return_points = false)
    # uniform random values on [0, 1]
    x = rand(Float64, (n, 1))
    y = rand(Float64, (n, 1))

    # if a point lies within the unit circle
    # count it
    count = sum(x.^2 + y.^2 .<= 1.0)

    pi_hat = 4 * count / n
    if return_points == true
        return pi_hat, x, y
    else
        return pi_hat
    end
end

pi_hat = estimate_pi(10^6)

# print the estimate for pi
println("An estimate for pi is: ", pi_hat)


pi_hat2, x, y = estimate_pi(100, true)

x_circ = Array(range(0.0, 1.0, length=101))
y_circ = (- x_circ.^2 .+ 1.0).^0.5

plot(x_circ, y_circ, fill=(0, 0.2, :blue), linewidth=5, label= "Circle")
scatter!(x, y, title = "Graph of points in and outside the unit circle", label="Sample Points")
xlabel!("x")
ylabel!("y")
savefig("pi_plot.png")
