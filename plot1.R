#plot1

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

#plot1
with(power, hist(Global_active_power, col = "red", 
                 xlab = "Global active power(kilowatts)",
                 main = "Global Active Power"))
dev.copy(png,"plot1.png")
dev.off()

#alternative
png("plot1.png")
with(power, hist(Global_active_power, col = "red", 
                 xlab = "Global active power(kilowatts)",
                 main = "Global Active Power"))
dev.off()
