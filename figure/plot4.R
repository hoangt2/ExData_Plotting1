# Reading input file
hpc = read.csv('household_power_consumption.txt', sep = ';')

# Parse the date and subset the data
hpc$Date = strptime(hpc$Date, '%d/%m/%Y')
hpc = hpc[hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02',]

# Combine date and time columns
hpc$Date_Time = as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

# Factor column classes to numeric
hpc$Sub_metering_1 = as.double(levels(hpc$Sub_metering_1))[hpc$Sub_metering_1]
hpc$Sub_metering_2 = as.double(levels(hpc$Sub_metering_2))[hpc$Sub_metering_2]
hpc$Sub_metering_3 = as.double(levels(hpc$Sub_metering_3))[hpc$Sub_metering_3]
hpc$Voltage = as.double(levels(hpc$Voltage))[hpc$Voltage]
hpc$Global_reactive_power = as.double(levels(hpc$Global_reactive_power))[hpc$Global_reactive_power]

# Plot to file

png('plot4.png')

par(mfrow = c(2,2))

# Plot 1
plot(hpc$Date_Time, hpc$Global_active_power, 
     type = 'l', 
     xlab = '',
     ylab = 'Global Active Power (kilowatt)')
# Plot 2
plot(hpc$Date_Time, hpc$Voltage, 
     type = 'l', 
     xlab = 'datetime', 
     ylab = 'Voltage')

# Plot 3
plot(hpc$Date_Time, hpc$Sub_metering_1, type = 'l', 
     xlab = '', ylab = 'Energy sub metering')
lines(hpc$Date_Time, hpc$Sub_metering_2,col='red')
lines(hpc$Date_Time, hpc$Sub_metering_3,col='blue')
legend('topright', 
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lty= 1,
       col = c('black','red','blue'))

# Plot 4
plot(hpc$Date_Time, hpc$Global_reactive_power, 
     type = 'l', 
     xlab = 'datetime', 
     ylab = 'Global_reactive_power')

dev.off()