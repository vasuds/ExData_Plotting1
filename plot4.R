# Read the full .txt document
epcdataset <- read.table("household_power_consumption.txt", header = TRUE ,sep = ";",na.string = "?")

epcdataset$Date <- as.Date(epcdataset$Date, format="%d/%m/%Y")

# Get only those variables which dates equal the 1st or 2nd of February, 2007

subset_epcdataset <- subset(epcdataset,Date == "2007-02-01" | Date=="2007-02-02")

# Converting dates
DateTime <- paste(as.Date(subset_epcdataset$Date),subset_epcdataset$Time)

subset_epcdataset$DateTime <- strptime(DateTime, format="%Y-%m-%d %H:%M:%S", tz="")

# Create the .PNG graphic device, 480x480pixel is default size
png("plot4.png", width=480, height=480)

# Create a 2x2 matrix for plotting each graph in the graphic canvas
par(mfrow=c(2,2))

# Generate the line chart at the top-left corner for plot4
plot(subset_epcdataset$DateTime, subset_epcdataset$Global_active_power, 
     type="l", # Draw lines instead of dots
     xlab="", # Empty x-label string
     ylab="Global Active Power"
)

# Generate the line chart at the top-right corner for plot4
plot(subset_epcdataset$DateTime, subset_epcdataset$Voltage, 
     type="l", # Draw lines instead of dots
     xlab="datetime",
     ylab="Voltage"
)

# Generate the line chart at the botton-left corner for plot4

plot(subset_epcdataset$DateTime,
     subset_epcdataset$Sub_metering_1,
     type="l", 
     ylab="Energy Sub metering", 
     xlab="")
# Add lines for Sub_metering_2 data in red color
lines(subset_epcdataset$DateTime,subset_epcdataset$Sub_metering_2,col="red")
# Add lines for Sub_metering_3 data in blue color
lines(subset_epcdataset$DateTime,subset_epcdataset$Sub_metering_3,col="blue")

# Add legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lwd=1 ,# Line width
       bty="n" # Remove box around the legend
)



# Generate the line chart at the bottom-right corner for plot4
plot(subset_epcdataset$DateTime, subset_epcdataset$Global_reactive_power, 
     type="l", # Draw lines instead of dots
     xlab="datetime",
     ylab="Global_reactive_power"
)


# Close the .PNG graphic device
dev.off()