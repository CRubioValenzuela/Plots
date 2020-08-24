# Working with data

install.packages("data.table")
library(data.table)

# Read data 

HPC <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Histogram 
HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Type
HPC[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates
HPC <- HPC[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Plot 1

png("plot1.png", width=480, height=480)

hist(HPC[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

# Plot 2

# Read data 

HPC <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?"
)

HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change format

HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter dates

HPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = HPC[, dateTime]
     , y = HPC[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

# Plot 3

# Read data 

HPC <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?"
)

HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change date format
HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates 
HPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

plot(HPC[, dateTime], HPC[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(HPC[, dateTime], HPC[, Sub_metering_2],col="red")
lines(HPC[, dateTime], HPC[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

# Plot 4

# Read data 

HPC <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?"
)

HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change date format
HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates 
HPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(HPC[, dateTime], HPC[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(HPC[, dateTime],HPC[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(HPC[, dateTime], HPC[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(HPC[, dateTime], HPC[, Sub_metering_2], col="red")
lines(HPC[, dateTime], HPC[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(HPC[, dateTime], HPC[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()