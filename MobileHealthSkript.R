install.packages("readxl")
library("readxl")

#just some test commands
plot(rnorm(1000))
x <- rnorm(1000)
hist(x,freq=F)
curve(dnorm(x), add=T)

# make surey data are placed in the right directory
getwd()

# read in StecOunter data
my.StepCounterData <- read.table("./DataGroupedBySensor/StepCounter.csv", sep=",")
my.StepCounterData
summary(my.StepCounterData)
head(my.StepCounterData)
plot(my.StepCounterData)

# read in SteDetector data
my.StepDetectorData <- read.table("./DataGroupedBySensor/Stepdetector.csv", sep=",")
head(my.StepDetectorData)
plot(my.StepDetectorData)

#read in AccelerometerSensor
my.AccellerationData <- read_excel("./DataGroupedBySensor/AccelerometerSensor.xlsx")
head(my.AccellerationData)

#normalize timestemp
mt <- min(my.AccellerationData$timestamp)
my.AccellerationData$timestamp <- my.AccellerationData$timestamp - mt
head(my.AccellerationData)

#TODO error!
my.AccellerationData$mag = sqrt(my.AccellerationData$x^2 + my.AccellerationData$y^2 + my.AccellerationData$z^2)




# TODO devide walking cand cyling data groups
