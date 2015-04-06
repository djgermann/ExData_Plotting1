## script to load household power consumption and plot histogram of global 
## active power over two days

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

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(dataSubset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)" )

dev.off()

