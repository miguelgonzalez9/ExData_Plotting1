# Plot 3.
library(dplyr)
library(lubridate)
#Read data
power_data <- read.table("household_power_consumption.txt", sep = ";", header = T)
View(power_data)
pow <- power_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
# tranform time and date variables, and Sub_matering varibales.
pow <- mutate(pow, date_time = paste(pow$Date, pow$Time))
pow$date_time <- dmy_hms(pow$date_time)
pow$Sub_metering_1 <- as.numeric(pow$Sub_metering_1)
pow$Sub_metering_2 <- as.numeric(pow$Sub_metering_2)
pow$Sub_metering_3 <- as.numeric(pow$Sub_metering_3)
# Line graph in PNG file
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(pow,plot(type = "n",date_time,Sub_metering_1, ylab = "Energy sub metering", xlab = ""))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
with(pow,lines(date_time,Sub_metering_1, col = "black"))
with(pow,lines(date_time,Sub_metering_2, col = "red"))
with(pow,lines(date_time,Sub_metering_3, col = "blue"))
dev.off()
