getwd()
setwd('D:/R/ExData_Plotting1')
file <- "household_power_consumption.txt"
Data <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")
Data_ready <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]

hist(Data_ready$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
