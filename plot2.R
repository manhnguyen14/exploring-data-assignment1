#plot2

#setting up(same as in others)
  #here I use static file path: G:\household_power_consumption.txt. The file is 127mb, so I don't upload it here.
  #Link to download zip file: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

#please make sure the file exist. Or you just need to change the value of object: file_path
#so that the new value is the path to the file used in the assignment

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

#plot2
#plot2
with(power, {
  plot(datetime, Global_active_power, xlab = "", 
       ylab = "Global active power(kilowatts", 
       type = "l")
})

dev.copy(png, "plot2.png")
dev.off()
