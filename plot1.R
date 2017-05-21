
# Read the full .txt document
epcdataset <- read.table("household_power_consumption.txt", header = TRUE ,sep = ";",na.string = "?")

epcdataset$Date <- as.Date(epcdataset$Date, format="%d/%m/%Y")

# Get only those variables which dates equal the 1st or 2nd of February, 2007

subset_epcdataset <- subset(epcdataset,Date == "2007-02-01" | Date=="2007-02-02")

# Converting dates
DateTime <- paste(as.Date(subset_epcdataset$Date),subset_epcdataset$Time)

subset_epcdataset$DateTime <- strptime(DateTime, format="%Y-%m-%d %H:%M:%S", tz="")

# Create the .PNG graphic device, 480x480 pixel is default size
png("plot1.png", width=480, height=480)

# Generate the histogram for plot1
title <- "Global Active Power"
hist(subset_epcdataset$Global_active_power,col="red",main="Global Active Power", xlab=paste(title, " (kilowatts)"), ylab="Frequency")

# Close the .PNG graphic device
dev.off()
