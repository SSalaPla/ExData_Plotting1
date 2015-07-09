
# Plot 1
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
hist(gap, col="red", main = "Global Active Power" ,xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

