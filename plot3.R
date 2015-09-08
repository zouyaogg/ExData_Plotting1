# reading csv data
data <- read.csv("./household_power_consumption.txt",header=T,sep = ";",na.strings = "?")

# subsetting data between 1/2/2007 and 2/2/2007
sd <- subset(data, as.character(Date) %in% c("1/2/2007", "2/2/2007"))
sd <- cbind(strptime(paste(sd$Date, sd$Time), "%d/%m/%Y %H:%M:%S"), sd)
names(sd) <- c("DateTime", "Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")

# make plot
png(filename = "plot3.png", bg = "white")
plot(sd$DateTime, sd$SubMetering1, xlab = "Datetime",ylab = "Energy Sub Metering", type="n")
lines(sd$DateTime, sd$SubMetering1, col = "black")
lines(sd$DateTime, sd$SubMetering2, col = "red")
lines(sd$DateTime, sd$SubMetering3, col = "blue")
legend("topright", legend = c("SubMetering1", "SubMetering2", "SubMetering3"), col = c("black", "red", "blue"),  lwd = 3)
dev.off()
