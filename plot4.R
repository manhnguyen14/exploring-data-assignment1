#plot4

#setting up(same as in others)
#here I use static file path: G:\household_power_consumption.txt

#make sure the file exist. Or just change the file_path

file_path = "G:\household_power_consumption.txt"

#number of sample needed: nrow1 = hours in 2 days * mins in 1 hour
nrow1 = 48*60
#read table
power = read.table(file_path, header = TRUE, sep = ";",
                   skip = 66636, nrows = nrow1)
#get the title (a bit complicated)
title = read.table(file_path, header = TRUE, sep = ";",
                   nrows = 1)
colnames(power) = colnames(title)
#view data
View(power)

#set date and time
power$dt = paste(power$Date, power$Time)
power$datetime = strptime(power$dt, format = "%d/%m/%Y %H:%M:%S")

#plot4
png("plot4.png")
par(mfrow = c(2,2))
with(power,{
  plot(datetime, Global_active_power, xlab = "", 
       ylab = "Global active power(kilowatts", 
       type = "l")
  
  plot(datetime, Voltage, type = "l")
  
{
    plot(datetime, Sub_metering_1, type = "l",
         xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    labels = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
    colors = c("black", "red", "blue")
    legend("topright", legend = labels, lwd = 1, col = colors)  
  }

plot(datetime, Global_reactive_power, type = "l")
})
dev.off()