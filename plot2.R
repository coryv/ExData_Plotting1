# load required packages
library(lubridate)

# read in, format dates, and subset data
projectData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
projectData["Date"] <- lapply(projectData["Date"], dmy)
projectData <- subset(projectData, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create POSIXct DateTime
projectData$DateTime <- as_datetime(paste(projectData$Date, projectData$Time), tz = "EST")

#create chart png
projectData$DateTime <- as_datetime(paste(projectData$Date, projectData$Time), tz = "EST")

png("plot2.png", width = 480, height = 480)
plot(projectData$DateTime, as.numeric(as.character(projectData$Global_active_power)), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
