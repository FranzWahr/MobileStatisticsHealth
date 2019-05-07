#just some test commands
plot(rnorm(1000))
x <- rnorm(1000)
hist(x,freq=F)
curve(dnorm(x), add=T)

# make surey data are placed in the right directory
getwd()

my.data <- read.table(header=TRUE, "Preprocessed Activity Log Data Export.txt", sep="|")
summary(my.data)

# TODO devide walking cand cyling data groups
