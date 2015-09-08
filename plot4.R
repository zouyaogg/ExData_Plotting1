# reading csv data
data <- read.csv("./household_power_consumption.txt",header=T,sep = ";",na.strings = "?")

# subsetting data between 1/2/2007 and 2/2/2007
sd <- subset(data, as.character(Date) %in% c("1/2/2007", "2/2/2007"))
sd <- cbind(strptime(paste(sd$Date, sd$Time), "%d/%m/%Y %H:%M:%S"), sd)
names(sd) <- c("DateTime", "Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")

# make plot
png(filename = "plot4.png", bg = "white")

par(mfrow = c(2,2), mar = c(4,3,3,3))

## left-up plot
plot(sd$DateTime, sd$GlobalActivePower, xlab = "Datetime",ylab = "Global Active Power", type="n")
lines(sd$DateTime, sd$GlobalActivePower)

## right-up plot
plot(sd$DateTime, sd$Voltage, xlab = "Datetime",ylab = "Voltage", type="n")
lines(sd$DateTime, sd$Voltage)

## left-down plot
plot(sd$DateTime, sd$SubMetering1, xlab = "Datetime",ylab = "Energy Sub Metering", type="n")
lines(sd$DateTime, sd$SubMetering1, col = "black")
lines(sd$DateTime, sd$SubMetering2, col = "red")
lines(sd$DateTime, sd$SubMetering3, col = "blue")
legend("topright", legend = c("SubMetering1", "SubMetering2", "SubMetering3"), col = c("black", "red", "blue"),  lwd = 1, box.lwd = 0, cex = 0.7)

## right-down plot
plot(sd$DateTime, sd$GlobalReactivePower, xlab = "Datetime",ylab = "Global Reactive Power", type="n")
lines(sd$DateTime, sd$GlobalReactivePower)
dev.off()
