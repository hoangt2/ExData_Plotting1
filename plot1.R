# Reading input file
hpc = read.csv('household_power_consumption.txt', sep = ';')

# Parse the date and subset the data
hpc$Date = strptime(hpc$Date, '%d/%m/%Y')
hpc = hpc[hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02',]

hpc$Global_active_power = as.double(hpc$Global_active_power)

# Plot to file
png('plot1.png')
hist(hpc$Global_active_power, col= 'red', 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatt)')
dev.off()
