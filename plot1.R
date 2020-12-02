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
#                    Creating plot1.png                      #
#------------------------------------------------------------#
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main ="Global Active power", xlab = "Global Active Power (Kilowatts)")
dev.off()

