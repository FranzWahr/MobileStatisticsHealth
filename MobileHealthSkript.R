install.packages("readxl")
library("readxl")

#just some test commands
plot(rnorm(1000))
x <- rnorm(1000)
hist(x,freq=F)
curve(dnorm(x), add=T)

# make surey data are placed in the right directory
getwd()

# read in StepcOunter data
my.StepCounterData <- read.table("./DataGroupedBySensor/StepCounter.csv", sep=",")
my.StepCounterData
summary(my.StepCounterData)
head(my.StepCounterData)
plot(my.StepCounterData)

# read in SteDetector data TODO xlsx
my.StepDetectorData <- read.table("./DataGroupedBySensor/Stepdetector.csv", sep=",")
head(my.StepDetectorData)
plot(my.StepDetectorData)

#read in AccelerometerSensor TODO xlsx
my.AccellerationData <- read_excel("./DataGroupedBySensor/AccelerometerSensor.xlsx")
head(my.AccellerationData)

#normalize timestemp
mt <- min(my.AccellerationData$timestamp)
my.AccellerationData$timestamp <- my.AccellerationData$timestamp - mt
head(my.AccellerationData)

#compute vecot sum of acceleration vecotrs
my.AccellerationData$mag = sqrt(as.numeric(my.AccellerationData$x)^2 + as.numeric(my.AccellerationData$y)^2 + as.numeric(my.AccellerationData$z)^2)
head(my.AccellerationData)

#parse vector values to numerics
my.AccellerationData$x = as.numeric(my.AccellerationData$x)
my.AccellerationData$y = as.numeric(my.AccellerationData$y)
my.AccellerationData$z = as.numeric(my.AccellerationData$z)

#plot all
plot(my.AccellerationData$timestamp/1000, my.AccellerationData$mag, type="l",xlab="Seconds", ylab="Acceleration Magnitude")



#compute mean and variance for both conditions
mean(my.AccellerationData[my.AccellerationData$StatusID==21,]$mag)
mean(my.AccellerationData[my.AccellerationData$StatusID==22,]$mag)
var(my.AccellerationData[my.AccellerationData$StatusID==21,]$mag)
var(my.AccellerationData[my.AccellerationData$StatusID==22,]$mag)

#meanfor vertical acceleration (z)
mean(my.AccellerationData[my.AccellerationData$StatusID==20,]$z)
mean(my.AccellerationData[my.AccellerationData$StatusID==21,]$z)
mean(my.AccellerationData[my.AccellerationData$StatusID==22,]$z)
mean(my.AccellerationData[my.AccellerationData$StatusID==23,]$z)
# working hypothesis derivable: vertical acceleration is lower in cycling


# TODO devide and group walking cand cyling data groups


