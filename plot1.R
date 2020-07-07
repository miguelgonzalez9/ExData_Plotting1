## Plot 1.
library(dplyr)
library(lubridate)
## Download and read data.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url, destfile = "data.zip")
unzip("data.zip")
power_data <- read.table("household_power_consumption.txt", sep = ";", header = T)
pow <- power_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
pow <- mutate(pow,  GAP = as.numeric(Global_active_power))
## Histogram
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(pow$GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") 
dev.off()
