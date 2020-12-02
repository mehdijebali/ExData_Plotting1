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
#                    Creating plot2.png                      #
#------------------------------------------------------------#
png("plot2.png", width = 480, height = 480)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subSetData$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()




