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
#                    Creating plot3.png                      #
#------------------------------------------------------------#
sub1 <- as.numeric(subSetData$Sub_metering_1)
sub2 <- as.numeric(subSetData$Sub_metering_2)
sub3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, sub1, type="l", col="black", xlab="", ylab="Energy submetering")
lines(datetime, sub2, type="l", col="red", xlab="", ylab="Energy submetering")
lines(datetime, sub3, type="l", col="blue", xlab="", ylab="Energy submetering")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, lwd=2.5,
       col = c("black", "red", "blue"))
dev.off()