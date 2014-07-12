
library(dplyr)

setwd('C:/Users/Jul/Box Sync/_PhD/_Big Data/Coursera/Exploratory Data Analysis/')

#dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=TRUE, sep=';')

newFile <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

#create new column - DateTime
newFile$DateTime <- paste(newFile$Date, newFile$Time) 
newFile$DateTime <- as.Date(newFile$DateTime, format = "%d/%m/%Y %H:%M:%S")


#filter values for only two dates and store them in df = subsetted

subsetted <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
subsetted$DateTime2 <- strptime(paste(subsetted$Date,subsetted$Time), format="%d/%m/%Y %H:%M:%S")


#png 1 - Global_active_power
png('plot1.png', width=480, height=480)
hist(subsetted$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()