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

# Plot to file
png('plot3.png')
plot(hpc$Date_Time, hpc$Sub_metering_1, type = 'l', 
     xlab = '', ylab = 'Energy sub metering')
lines(hpc$Date_Time, hpc$Sub_metering_2,col='red')
lines(hpc$Date_Time, hpc$Sub_metering_3,col='blue')
legend('topright', 
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lty= 1,
       col = c('black','red','blue'))
dev.off()