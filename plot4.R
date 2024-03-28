getwd()
setwd('D:/R/ExData_Plotting1')
file <- "household_power_consumption.txt"
Data <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

Sys.setlocale("LC_TIME", "English")

Data_ready <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]

Date_time <- as.POSIXct(paste(Data_ready$Date, Data_ready$Time), format="%d/%m/%Y %H:%M:%S")

Data_ready$Date_time <- Date_time

png(file="plot4.png", height=480, width=480)

par(mfrow = c(2,2))

plot(Date_time, Data_ready$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(Date_time, Data_ready$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(Date_time, Data_ready$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(Date_time, Data_ready$Sub_metering_2, col = "red")
lines(Date_time, Data_ready$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")

plot(Date_time, Data_ready$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()