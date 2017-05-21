# Read the full .txt document
epcdataset <- read.table("C:/Users/Padma/Desktop/Coursera/Exploratory Data Analysis/Week1/household_power_consumption.txt", header = TRUE ,sep = ";",na.string = "?")

epcdataset$Date <- as.Date(epcdataset$Date, format="%d/%m/%Y")

# Get only those variables which dates equal the 1st or 2nd of February, 2007

subset_epcdataset <- subset(epcdataset,Date == "2007-02-01" | Date=="2007-02-02")

# Converting dates
DateTime <- paste(as.Date(subset_epcdataset$Date),subset_epcdataset$Time)

subset_epcdataset$DateTime <- strptime(DateTime, format="%Y-%m-%d %H:%M:%S", tz="")

# Create the .PNG graphic device, 480x480pixel is default size
png("plot2.png", width=480, height=480)

# Generate the line plot for plot2

plot(subset_epcdataset$DateTime,
     subset_epcdataset$Global_active_power,
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# Close the .PNG graphic device
dev.off()
