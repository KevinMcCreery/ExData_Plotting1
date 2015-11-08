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


###Plot1
hist(dt2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#save as PNG, making sure right # of pixels
#dev.off()
dev.print(png, file = "./plot1.png", width = 480, height = 480)