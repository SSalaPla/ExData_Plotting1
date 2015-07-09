
# Plot 3
# Read the data
dat <- read.table("./household_power_consumption.txt",sep=";",header=TRUE) 
# Show the first lines
head(dat)
# Select only the date of interest
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
dates <- as.Date(as.character(dat$Date), format="%d/%m/%Y")
data <- subset(dat, (dates >= date1) & (dates <= date2))

f <- data$Sub_metering_1
s1 <- as.numeric(levels(f))[f]
f <- data$Sub_metering_2
s2 <- as.numeric(levels(f))[f]
s3 <- data$Sub_metering_3


dt <- paste(data$Date, data$Time)
dtn <- strptime(dt, "%d/%m/%Y %H:%M:%S")
t <- as.numeric(dtn)
t <- t - t[1]

plot(t,s1, type="l", xlab="",xaxt='n', ylab = "Energy sub metering")

tmax <- tail(t,n=1)
axis(1, at=c(0,tmax/2,tmax), c("Thu","Fri","Sat"))
lines(t,s2,col="red")
lines(t,s3,col="blue")
legend("topright", lwd=1 ,col = c("black",  "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
