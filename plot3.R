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

# and time to applicable format
x<-strptime(paste(as.character(hh$Date),hh$Time),format="%Y-%m-%d %H:%M:%S")

# Let's draw!
plot(x, hh$Sub_metering_1, type="l", ylab = "Global Active power (kilowatts)", xlab="")
  lines(x,hh$Sub_metering_2, col = "red")
  lines(x,hh$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),col=c("black","blue","red"), cex=0.7, y.intersp = 0.5)

# save to png with default parameters
dev.copy(png, filename = "plot3.png", width= 480, height = 480, units = "px")
dev.off()

