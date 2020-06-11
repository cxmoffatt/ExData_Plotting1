##read in the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

##subset data and convert to numeric values
subsetted <- subset(data, (Date >= "2007-02-01") & (Date <= "2007-02-02"), )

##plot histogram and output
png("plot1.png")
hist(subsetted$Global_active_power, col = "red", xlab = "Global Active Power (Killowats)", ylab = "Frequency", main = "Global Active Power", xlim = c(0,6))

dev.off()