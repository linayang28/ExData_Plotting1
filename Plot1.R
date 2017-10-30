
## Plot1
## Read file
## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates rather than 
## reading in the entire dataset and subsetting to those dates.

## prerequisite: setwd() has been set and "household_power_consumption.txt" has been downloaded to wd already

powerData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
colnames(powerData)<-c("Date","Time", "Global_active_power", "Global_reactive_power", 
                       "Voltage", "Global_intensity","Sub_metering_1",
                       "Sub_metering_2","Sub_metering_3")

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(file = "Plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, col="red", main= "Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
