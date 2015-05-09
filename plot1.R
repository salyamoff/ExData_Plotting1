#Let's go!
household<-read.table("~/household_power_consumption.txt", sep=";", header = TRUE)
household$Date<-as.Date(household$Date, "%d/%m/%Y")

# Copy only the rows fulfill the conditions
fa<-(household$Date=="2007-02-01")|(household$Date=="2007-02-02")
hh<-household[fa,]

# this values expendable
rm(household)
rm(fa)

# direct conversion not enough because it's factor!!!
hh$Global_active_power<-as.numeric(as.character(hh$Global_active_power))

# draw histogram
hist(hh$Global_active_power, col="Red", ylab = "Frequency", xlab = "Global Active power (kilowatts)", main = "Global Active power")

# save to png with default parameters
dev.copy(png, filename = "plot1.png", width= 480, height = 480, units = "px")
dev.off()

