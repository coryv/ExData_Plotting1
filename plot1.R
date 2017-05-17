# load required packages
library(lubridate)

# read in, format dates, and subset data
projectData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
projectData["Date"] <- lapply(projectData["Date"], dmy)
projectData <- subset(projectData, Date >= "2007-02-01" & Date <= "2007-02-02")

#create chart png
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(projectData$Global_active_power)), 
     freq = TRUE, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()