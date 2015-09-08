# reading csv data
data <- read.csv("./household_power_consumption.txt",header=T,sep = ";",na.strings = "?")

# subsetting data between 1/2/2007 and 2/2/2007
sd <- subset(data, as.character(Date) %in% c("1/2/2007", "2/2/2007"))

# make histogram
png(filename = "plot1.png", bg = "white")
hist(sd$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
dev.off()
