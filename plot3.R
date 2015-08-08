## Load, subset and convert
hpc <- read.csv('household_power_consumption.txt', header=T, sep=';', na.strings='?')
hpc$Date <- as.Date(hpc$Date, format='%d/%m/%Y')
powersub <- subset(hpc, Date >= '2007-02-01' & Date <= '2007-02-02')
rm(hpc)

powersub$Dtime <- as.POSIXct(paste(as.Date(powersub$Date), powersub$Time))

#Plot
dev.off()
plot(powersub$Sub_metering_1 ~ powersub$Dtime, type='l',
     ylab='Energy sub metering',
     xlab='')
  legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
         col = c("black", "red", "blue"), lty = 'solid')
  lines(powersub$Sub_metering_2 ~ powersub$Dtime, col='red')
  lines(powersub$Sub_metering_3 ~ powersub$Dtime, col='blue')
    
#Save
dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()