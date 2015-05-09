# Set English for weekdays names
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# Let's read!
household<-read.table("~/household_power_consumption.txt", sep=";", header = TRUE,stringsAsFactors = FALSE) # all reading strings is characters
household$Date<-as.Date(household$Date, "%d/%m/%Y")

# Copy only the rows fulfill the conditions
fa<-(household$Date=="2007-02-01")|(household$Date=="2007-02-02")
hh<-household[fa,]

# this values expendable
rm(household)
rm(fa)

# Convert characters to numbers
hh$Global_active_power<-as.numeric(hh$Global_active_power)
hh$Sub_metering_1<-as.numeric(hh$Sub_metering_1)
hh$Sub_metering_2<-as.numeric(hh$Sub_metering_2)
hh$Sub_metering_3<-as.numeric(hh$Sub_metering_3)
hh$Global_reactive_power<-as.numeric(hh$Global_reactive_power)
hh$Voltage<-as.numeric(hh$Voltage)

# and time to applicable format
x<-strptime(paste(as.character(hh$Date),hh$Time),format="%Y-%m-%d %H:%M:%S")

# set space 2x2 to plot
par(mfcol = c(2,2))

# Plot 1 (plot2.R)
plot(x, hh$Global_active_power, type="l", ylab = "Global Active power (kilowatts)", xlab = "")

# Plot 2 (plot3.R)
plot(x, hh$Sub_metering_1, type="l", ylab = "Global Active power (kilowatts)", xlab="")
  lines(x,hh$Sub_metering_2, col = "red")
  lines(x,hh$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),col=c("black","blue","red"), bty="n",cex=0.8, y.intersp = 0.2)

# Plot 3 and 4
plot(x, hh$Voltage, type="l", xlab="datatime", ylab="Voltage")
plot(x, hh$Global_reactive_power, type="l", xlab="datatime", ylab="Global_reactive_power")

# save to png with default parameters
dev.copy(png, filename = "plot4.png", width= 480, height = 480, units = "px")
dev.off()

