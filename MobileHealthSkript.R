plot(rnorm(1000))
x <- rnorm(1000)
hist(x,freq=F)
curve(dnorm(x), add=T)
