## Load, subset and convert
hpc <- read.csv('household_power_consumption.txt', header=T, sep=';', na.strings='?')
hpc$Date <- as.Date(hpc$Date, format='%d/%m/%Y')
powersub <- subset(hpc, Date >= '2007-02-01' & Date <= '2007-02-02')
rm(hpc)

powersub$Dtime <- as.POSIXct(paste(as.Date(powersub$Date), powersub$Time))

## Plot
dev.off()
par(mfrow=c(2,2))
  plot(powersub$Global_active_power ~ powersub$Dtime,
       type='l', ylab='Global Active Power', xlab='')
  plot(powersub$Voltage ~ powersub$Dtime,
       type='l', ylab='Voltage', xlab='datetime')
  plot(powersub$Sub_metering_1 ~ powersub$Dtime,
       type='l', ylab='Energy sub metering', xlab='')
    lines(powersub$Sub_metering_2 ~ powersub$Dtime,col='Red')
    lines(powersub$Sub_metering_3 ~ powersub$Dtime,col='Blue')
    # legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
    # col = c("black", "red", "blue"), lty = 'solid', bty='n')
  plot(powersub$Global_reactive_power ~ powersub$Dtime,
       type='l', ylab='Global Reactive Power',xlab='datetime')

## Save
dev.copy(png, file='plot4.png', height=480, width=480)
dev.off()