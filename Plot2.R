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

#plot2
png(filename = "plot2.png")
with(datasub, plot(Global_active_power~DateTime, ylab =
       "Global Active Power (kilowatts)", type = "l", xlab = ""))
dev.off()

