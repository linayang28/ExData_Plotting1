

## Plot3
## Read file
## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates rather than 
## reading in the entire dataset and subsetting to those dates.

## prerequisite: setwd() has been set and "household_power_consumption.txt" has been downloaded to wd already

powerData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
colnames(powerData)<-c("Date","Time", "Global_active_power", "Global_reactive_power", 
                       "Voltage", "Global_intensity","Sub_metering_1",
                       "Sub_metering_2","Sub_metering_3")

powerData$Date<- as.Date(powerData$Date,format = "%d/%m/%Y")
DateTime <- paste(powerData$Date, powerData$Time)
powerData$Datetime <- as.POSIXct(DateTime)

## Construct the plot 
png(file = "Plot3.png")
with(powerData, {
        plot(Sub_metering_1 ~ powerData$Datetime, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2 ~ powerData$Datetime, col = 'Red')
        lines(Sub_metering_3 ~ powerData$Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
