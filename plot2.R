# Reading input file
hpc = read.csv('household_power_consumption.txt', sep = ';')

# Parse the date and subset the data
hpc$Date = strptime(hpc$Date, '%d/%m/%Y')
hpc = hpc[hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02',]

# Combine date and time columns
hpc$Date_Time = as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

# Plot to file
png('plot2.png')
plot(hpc$Date_Time, hpc$Global_active_power, 
     type = 'l', 
     xlab = '',
     ylab = 'Global Active Power (kilowatt)')
dev.off()