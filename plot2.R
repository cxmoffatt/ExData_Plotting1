##read in the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data <- cbind(data, datetime)
data$Global_active_power <- as.numeric(data$Global_active_power)

##subset data and convert to numeric values
subsetted <- subset(data, (Date >= "2007-02-01") & (Date <= "2007-02-02"), )

##plot histogram and output
png("plot2.png")
with(subsetted, plot(x = datetime, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (killowatts)"))

dev.off() 