getwd()
setwd('D:/R/ExData_Plotting1')
file <- "household_power_consumption.txt"
Data <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")
Data_ready <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]

Date_time <- as.POSIXct(paste(Data_ready$Date, Data_ready$Time), format="%d/%m/%Y %H:%M:%S")

Data_ready$Date_time <- Date_time

png(file="plot3.png", height=480, width=480)

plot(Date_time, Data_ready$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(Date_time, Data_ready$Sub_metering_2, col = "red")
lines(Date_time, Data_ready$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)


dev.off()