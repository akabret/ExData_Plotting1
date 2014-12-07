# Read in the data!  
hpc <- read.csv("./household_power_consumption.txt",sep=";")

# Strip out the two days we care about
hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

# Chart 1 -- be sure to cast Global_active_power as an integer
par(mfrow = c(1,1), bg="white")
hist(as.integer(hpc2$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()