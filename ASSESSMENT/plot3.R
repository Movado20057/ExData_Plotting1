## Reading the entire data file
data_file <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
data_file$Date <- as.Date(data_file$Date, format = "%d/%m/%Y")

## two days data
twoDaysData <- subset(data_file, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_file)

## Converting dates
dateTime <- paste(as.Date(twoDaysData$Date), twoDaysData$Time)
twoDaysData$Datetime <- as.POSIXct(dateTime)

## Plotting

with(twoDaysData, {
    plot(Sub_metering_1 ~ Datetime, type = "l", 
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))