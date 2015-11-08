###Created on 11/8/2015 by Kevin McCreery
#Purpose: to fulfill the specifications of Course Project 1 
#of the Johns Hopkins Coursera Data Science Specialization (Exploratory Data Analysis).

#Set directory, load packages, etc.
setwd("C:/Users/Kevin/ExData_Plotting1/")
library(data.table)
library(dplyr)
library(lubridate)

#read in data, subset, convert types, etc.
rawdata <- read.table("./household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";", colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double"))
dt <- data.table(rawdata)
dt2 <- subset(dt, Date %in% c("1/2/2007","2/2/2007"))
dt2[,1] <- dmy(dt2$Date)
dt2[,2] <- hms(dt2$Time)


###Plot3
png(filename = "./plot3.png", width = 480, height = 480)
#A line plot with all three sub metering variables, using different colors, with legend and titles
plot(dt2$Date + dt2$Time, dt2$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dt2$Date + dt2$Time, dt2$Sub_metering_2, type = "l", col = "red")
lines(dt2$Date + dt2$Time, dt2$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black", "red", "blue"))
#save as PNG, making sure right # of pixels, then turn off graphics device
dev.off()
