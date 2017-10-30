

## Plot4
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
png(file = "Plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(powerData, {
        plot(powerData$Global_active_power ~ powerData$Datetime, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(powerData$Voltage ~ powerData$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(powerData$Sub_metering_1 ~ powerData$Datetime, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(powerData$Sub_metering_2 ~ powerData$Datetime, col = 'Red')
        lines(powerData$Sub_metering_3 ~ powerData$Datetime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(powerData$Global_active_power ~ powerData$Datetime, type = "l", 
             ylab = "Global_rective_power", xlab = "datetime")
})
dev.off()
