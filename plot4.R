# Read in the data!  
hpc <- read.csv("./household_power_consumption.txt",sep=";")

# Strip out the two days we care about
hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

# Chart 4 -- This is little more than a combination of four charts, including two from above.
# Note the mfrow parameter which specifies a 2x2 grid.
par(mfrow = c(2,2), bg="white")
with(hpc2, {
	plot(DateTime, as.numeric(data.matrix(Global_active_power)), ylab="Global Active Power", xlab="", type="l")
	plot(DateTime, as.numeric(data.matrix(Voltage)), ylab="Voltage", xlab="datetime", type="l")
      plot(DateTime, as.numeric(data.matrix(Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
	lines(DateTime,  as.numeric(data.matrix(Sub_metering_2)), col="red", type="l")
	lines(DateTime,  as.numeric(data.matrix(Sub_metering_3)), col="blue", type="l")
	legend("topright", lty=1, box.lwd=340, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(DateTime, as.numeric(data.matrix(Global_reactive_power)), ylab="Global_reactive_power", xlab="datetime", type="l")})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()