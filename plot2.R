# Read in the data!  
hpc <- read.csv("./household_power_consumption.txt",sep=";")

# Strip out the two days we care about
hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

# Chart 2 -- first, create a new field DateTime as the union of the Date and Time fields
# Also, note that we have to coerce Global_active_power as a data matrix and THEN as numeric.
par(mfrow = c(1,1))
hpc2$DateTime <- strptime(paste(hpc2$Date, hpc2$Time),"%d/%m/%Y %H:%M:%S")
plot(hpc2$DateTime, as.numeric(data.matrix(hpc2$Global_active_power)), ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
