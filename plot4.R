##read in the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data <- cbind(data, datetime)

##subset data and convert to numeric values
subsetted <- subset(data, (Date >= "2007-02-01") & (Date <= "2007-02-02"), )

##plot histogram and output in 2 by 2 format
png("plot4.png")

par(mfrow=c(2,2))

##plot in first quadrant
with(subsetted, plot(x = datetime, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

##plot in second quadrant
with(subsetted, plot(x = datetime, y = Voltage, type = "l", ylab = "Voltage"))

##plot in third quadrant
with(subsetted, plot(x = datetime, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subsetted, lines(x = datetime, y = Sub_metering_2, col = "red"))
with(subsetted, lines(x = datetime, y = Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd=c(2, 2, 2), cex=c(0.4, 0.4, 0.4))

##plot in fourth quadrant
with(subsetted, plot(x = datetime, y = Global_active_power, type = "l"))

dev.off() 