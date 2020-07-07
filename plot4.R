#plot4.
library(dplyr)
library(lubridate)
#Read data
power_data <- read.table("household_power_consumption.txt", sep = ";", header = T)
pow <- power_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
# Pasting date and time and converting into date variables
pow <- mutate(pow, date_time = paste(pow$Date, pow$Time))
pow$date_time <- dmy_hms(pow$date_time)
#transforming variables into numeric variables.
colnames <- names(pow)[3:7]
pow[colnames] <- sapply(pow[colnames], as.numeric)
##
#Set plotting device.
png(filename = "plot4.png", width = 480, height = 480, units = "px")
#Set par
par(mfcol = c(2,2))
#1.
with(pow,plot(type = "n",date_time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = ""))
with(pow,lines(date_time, Global_active_power))
#2.
with(pow,plot(type = "n",date_time,Sub_metering_1, ylab = "Energy sub metering", xlab = ""))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
with(pow,lines(date_time,Sub_metering_1, col = "black"))
with(pow,lines(date_time,Sub_metering_2, col = "red"))
with(pow,lines(date_time,Sub_metering_3, col = "blue"))
#3.
with(pow, plot(type = "n", date_time, Voltage, xlab = "datetime"))
with(pow, lines(date_time, Voltage))
#4.
with(pow, plot(type = "n", date_time,Global_reactive_power, xlab = "datetime"))
with(pow, lines(date_time,Global_reactive_power))
# turn off device
dev.off()
