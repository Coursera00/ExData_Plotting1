
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


#Plot 4 - Multiple Plots in one

png('plot4.png')

# 2 rows and 2 columns
par(mfcol = c(2,2))

plot( subsetted$DateTime2, subsetted$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
plot(subsetted$DateTime2,subsetted$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(subsetted$DateTime2,subsetted$Sub_metering_2,type = "l", col = "red")
lines(subsetted$DateTime2,subsetted$Sub_metering_3,type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
plot( subsetted$DateTime2, subsetted$Voltage, type = "l",xlab = "datetime", ylab = "voltage")
plot(subsetted$DateTime2,subsetted$Global_reactive_power, type ='l', xlab ="datetime", ylab = "Global reactive power")
dev.off()