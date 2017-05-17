# load required packages
library(lubridate)

# read in, format dates, and subset data
projectData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
projectData["Date"] <- lapply(projectData["Date"], dmy)
projectData <- subset(projectData, Date >= "2007-02-01" & Date <= "2007-02-02")
projectData$DateTime <- as_datetime(paste(projectData$Date, projectData$Time), tz = "EST")

#initialize png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#Global Active Power in top left
plot(projectData$DateTime, as.numeric(as.character(projectData$Global_active_power)), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#Voltage by DateTime in top right
plot(projectData$DateTime, as.numeric(as.character(projectData$Voltage)), 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#Sub Metering bottom left
plot(projectData$DateTime, as.numeric(as.character(projectData$Sub_metering_1)),
     col = "black",
     type = "l",
     lty = 1,
     xlab = "", ylab = "Energy sub metering")
lines(projectData$DateTime, as.numeric(as.character(projectData$Sub_metering_2)),
      col = "red",
      type = "l",
      lty = 1)
lines(projectData$DateTime, as.numeric(as.character(projectData$Sub_metering_3)),
      col = "blue",
      type = "l",
      lty = 1)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bg = "transparent",
       box.lty = 0,
       box.lwd = 0)

# Global reactive power bottom right
plot(projectData$DateTime, as.numeric(as.character(projectData$Global_reactive_power)), 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

#write png
dev.off()