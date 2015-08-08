## Load, subset and convert
hpc <- read.csv('household_power_consumption.txt', header=T, sep=';', na.strings='?')
hpc$Date <- as.Date(hpc$Date, format='%d/%m/%Y')
powersub <- subset(hpc, Date >= '2007-02-01' & Date <= '2007-02-02')
rm(hpc)

powersub$Dtime <- as.POSIXct(paste(as.Date(powersub$Date), powersub$Time))

## Plot
dev.off()
hist(powersub$Global_active_power, 
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', 
     col='Red')

## Save
dev.copy(png, file='plot1.png', height=480, width=480)
dev.off()