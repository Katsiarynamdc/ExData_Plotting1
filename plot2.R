getwd()
setwd('D:/R/ExData_Plotting1')
file <- "household_power_consumption.txt"
Data <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")
Data_ready <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]

Sys.setlocale("LC_TIME", "English")
Date_time <- as.POSIXct(paste(Data_ready$Date, Data_ready$Time), format="%d/%m/%Y %H:%M:%S")
Data_ready$Datetime <- Date_time

png(file="plot2.png", height=480, width=480)
plot(Data_ready$Datetime, Data_ready$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
