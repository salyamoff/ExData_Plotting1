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

# and time to applicable format
x<-strptime(paste(as.character(hh$Date),hh$Time),format="%Y-%m-%d %H:%M:%S")

# Let's draw!
plot(x, hh$Global_active_power, type="l", ylab = "Global Active power (kilowatts)", xlab = "")

# save to png with default parameters
dev.copy(png, filename = "plot2.png", width= 480, height = 480, units = "px")
dev.off()

