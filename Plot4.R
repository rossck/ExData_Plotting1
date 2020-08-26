# Read the data into R
data <- read.table("household_power_consumption.txt", na.strings = "?",
                   header = T, sep = ";")

library(tidyverse)
data <- unite(data, Date, Time, col = "DateTime")

# Change class of Date and Time
library(lubridate)
data$DateTime <- dmy_hms(data$DateTime)

# Create the time range for subsetting
Time1 <- ymd_hms("2007-02-01-00-00-00")
Time2 <- ymd_hms("2007-02-03-00-00-00")

# SUbset by range
datasub <- subset(data, data$DateTime > Time1 & data$DateTime < Time2) 

# Plot 4
par(mfcol = c(2,2))
png(filename = "plot4.png")
#Topleft
with(datasub, plot(Global_active_power~DateTime, ylab =
                         "Global Active Power", type = "l", xlab = ""))
#Bottomleft
with(datasub,
     plot(Sub_metering_1~DateTime, ylab = "Energy sub metering", 
          type = "l", xlab = ""),) 
with(datasub, points(Sub_metering_2~DateTime, col = "red", type = "l"))
with(datasub, points(Sub_metering_3~DateTime, col = "blue", type = "l"))
#Topright
with(datasub,
     plot(Voltage~DateTime, ylab = "Voltage", 
          type = "l", xlab = "datetime"),)
#Bottomright
with(datasub, plot(Global_reactive_power~DateTime, type = "l", xlab = "datetime"))
dev.off()
