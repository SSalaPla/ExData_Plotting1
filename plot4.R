# Plot 4
# Read the data
dat <- read.table("./household_power_consumption.txt",sep=";",header=TRUE) 
# Show the first lines
head(dat)
# Select only the date of interest
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
dates <- as.Date(as.character(dat$Date), format="%d/%m/%Y")
data <- subset(dat, (dates >= date1) & (dates <= date2))

dt <- paste(data$Date, data$Time)
dtn <- strptime(dt, "%d/%m/%Y %H:%M:%S")
t <- as.numeric(dtn)
t <- t - t[1]
tmax <- tail(t,n=1)


par(mfrow = c(2, 2))


f <- data$Global_active_power
gap <- as.numeric(levels(f))[f]
plot(t,gap,type="l",xlab="", ylab="Global Active Power (kilowatts)", xaxt='n')
axis(1, at=c(0,tmax/2,tmax), c("Thu","Fri","Sat"))

f <- data$Voltage
volt <- as.numeric(levels(f))[f]
plot(t,volt,type="l",xlab="datetime", ylab="Voltage", xaxt='n')
axis(1, at=c(0,tmax/2,tmax), c("Thu","Fri","Sat"))

plot(t,s1, type="l", xlab="",xaxt='n', ylab = "Energy sub metering")
axis(1, at=c(0,tmax/2,tmax), c("Thu","Fri","Sat"))
lines(t,s2,col="red")
lines(t,s3,col="blue")
legend("topright",lwd=1, bty="n" ,col = c("black",  "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

f <- data$Global_reactive_power
grp <- as.numeric(levels(f))[f]
plot(t,grp,type="l",xlab="datetime", ylab="Global_reactive_power", xaxt='n')
axis(1, at=c(0,tmax/2,tmax), c("Thu","Fri","Sat"))

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

