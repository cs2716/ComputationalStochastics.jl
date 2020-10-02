using Random
using Statistics

# number of samples
n = 1000000

# uniform random values on [0, 1]
x = rand(Float64, (n, 1))
y = rand(Float64, (n, 1))

# if a point lies within the unit circle
# count it
count = sum(x.^2 + y.^2 .<= 1.0)

# print the estimate for pi
println("An estimate for pi is: ", (4*count/n))
