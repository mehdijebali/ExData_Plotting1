#------------------------------------------------------------#
#            Setting directory & reading Data                #
#------------------------------------------------------------#
setwd(dir = "C:/Users/MJB/Documents/Peer Assignment/Exploratory data" )
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#------------------------------------------------------------#
#                      Subsetting Data                       #
#------------------------------------------------------------#
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#------------------------------------------------------------#
#                    Creating plot4.png                      #
#------------------------------------------------------------#
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower<-as.numeric(subSetData$Global_active_power)
sub1 <- as.numeric(subSetData$Sub_metering_1)
sub2 <- as.numeric(subSetData$Sub_metering_2)
sub3 <- as.numeric(subSetData$Sub_metering_3)
voltage <- as.numeric(subSetData$Voltage)
globalreactive <- as.numeric(subSetData$Global_reactive_power)


png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
#1st plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#2nd plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#3rd plot
plot(datetime, sub1, type="l", col="black", xlab="", ylab="Energy submetering")
lines(datetime, sub2, type="l", col="red", xlab="", ylab="Energy submetering")
lines(datetime, sub3, type="l", col="blue", xlab="", ylab="Energy submetering")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, lwd=2.5,
       col = c("black", "red", "blue"))

#4th plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()