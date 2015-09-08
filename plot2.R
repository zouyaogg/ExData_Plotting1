# reading csv data
data <- read.csv("./household_power_consumption.txt",header=T,sep = ";",na.strings = "?")

# subsetting data between 1/2/2007 and 2/2/2007
sd <- subset(data, as.character(Date) %in% c("1/2/2007", "2/2/2007"))
sd <- cbind(strptime(paste(sd$Date, sd$Time), "%d/%m/%Y %H:%M:%S"), sd)
names(sd) <- c("DateTime", "Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")

# make plot
png(filename = "plot2.png", bg = "white")
plot(sd$DateTime, sd$GlobalActivePower, xlab = "Datetime",ylab = "Global Active Power (kilowatts)", type="n")
lines(sd$DateTime, sd$GlobalActivePower)
dev.off()
