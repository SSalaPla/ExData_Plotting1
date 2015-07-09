
# Plot 2
# Read the data
dat <- read.table("./household_power_consumption.txt",sep=";",header=TRUE) 
# Show the first lines
head(dat)
# Select only the date of interest
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
dates <- as.Date(as.character(dat$Date), format="%d/%m/%Y")
data <- subset(dat, (dates >= date1) & (dates <= date2))

f <- data$Global_active_power
gap <- as.numeric(levels(f))[f]


dt <- paste(data$Date, data$Time)
dtn <- strptime(dt, "%d/%m/%Y %H:%M:%S")
t <- as.numeric(dtn)
t <- t - t[1]

plot(t,gap,type="l",xlab="", ylab="Global Active Power (kilowatts)", xaxt='n')
tmax <- tail(t,n=1)
axis(1, at=c(0,tmax/2,tmax), c("Thu","Fri","Sat"))

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
