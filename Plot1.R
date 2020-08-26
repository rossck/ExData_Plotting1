# Read the data into R
data <- read.table("household_power_consumption.txt", na.strings = "?",
                   header = T, sep = ";")

# Change class of Date and Time
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# Subset based on the required dates
datasub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Plot1
png(filename = "plot1.png")
hist(datasub$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power
     (kilowatts)")
dev.off()

