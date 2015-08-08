## Load, subset and convert
hpc <- read.csv('household_power_consumption.txt', header=T, sep=';', na.strings='?')
hpc$Date <- as.Date(hpc$Date, format='%d/%m/%Y')
powersub <- subset(hpc, Date >= '2007-02-01' & Date <= '2007-02-02')
rm(hpc)

powersub$Dtime <- as.POSIXct(paste(as.Date(powersub$Date), powersub$Time))

## Plot
dev.off()
par(mfrow=c(2,2), mar = c(4,4,2,1))
with(powersub,{
  plot(Global_active_power ~ Dtime,
       type='l', ylab='Global Active Power', xlab='')
  plot(Voltage ~ Dtime,
       type='l', ylab='Voltage', xlab='datetime')
  plot(Sub_metering_1 ~ Dtime,
       type='l', ylab='Energy sub metering', xlab='')
    lines(Sub_metering_2 ~ Dtime,col='Red')
    lines(Sub_metering_3 ~ Dtime,col='Blue')
    # legend("topleft", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
    # col = c("black", "red", "blue"), bty='n', lwd = 1)
  plot(Global_reactive_power ~ Dtime,
       type='l', ylab='Global Reactive Power',xlab='datetime')
})


## Save
dev.copy(png, file='plot4.png', height=480, width=480)
dev.off()