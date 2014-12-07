# Read in the data!  
hpc <- read.csv("./household_power_consumption.txt",sep=";")

# Strip out the two days we care about
hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

# Chart 3 -- Just a bunch of lines.  Again, the challenge here was coercing the data first (otherwise it refused to display it as a line.
# The legend is new, but very straightforward.
par(mfrow = c(1,1))
plot(hpc2$DateTime, as.numeric(data.matrix(hpc2$Sub_metering_1)), type="l", ylab="Energy sub metering" xlab="")
lines(hpc2$DateTime,  as.numeric(data.matrix(hpc2$Sub_metering_2)), col="red", type="l")
lines(hpc2$DateTime,  as.numeric(data.matrix(hpc2$Sub_metering_3)), col="blue", type="l")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
