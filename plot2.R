## Plot 2.
library(dplyr)
library(lubridate)
#Read data
power_data <- read.table("household_power_consumption.txt", sep = ";", header = T)
View(power_data)
pow <- power_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
## tranform time and date variables.
pow <- mutate(pow, date_time = paste(pow$Date, pow$Time))
pow$date_time <- dmy_hms(pow$date_time)
pow <- mutate(pow,  GAP = as.numeric(Global_active_power))
## Line plot
with(pow,plot(type = "n",date_time, GAP, ylab = "Global Active Power (kilowatts)", xlab = ""))
with(pow,lines(date_time, GAP))
## Saving line plot to PNG file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(pow,plot(type = "n",date_time, GAP, ylab = "Global Active Power (kilowatts)", xlab = ""))
with(pow,lines(date_time, GAP))
dev.off()
