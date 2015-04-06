## script to load household power consumption and create four sub plots

data = read.table("household_power_consumption.txt",
                  sep=";",
                  dec=".",
                  header=TRUE,
                  stringsAsFactors=FALSE,
                  na.strings="?",
                  colClasses=c(rep("character",2), rep("numeric",7)))

#get subset of data for two days
dataSubset <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]  

#create new column with date time information
dataSubset$DateTime <- strptime(paste(dataSubset$Date, dataSubset$Time),
                                "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2, 2))
with(dataSubset, {
    plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", 
         xlab = "")
    plot(DateTime, Sub_metering_1, type = "l", col = "black", 
         xlab = "", ylab = "Engergy sub metering")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd=c(1,1,1), lty=c(1,1,1), bty = "n")
    plot(DateTime, Voltage, type = "l", xlab = "datetime")
    plot(DateTime, Global_reactive_power, type = "l" , xlab = "datetime")
})

dev.off()