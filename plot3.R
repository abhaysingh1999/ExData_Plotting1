#Reading The Data 

data <- read.table("C:/Users/abhay/Desktop/COURSERA/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

# Now changing the class of Date from character to Date class

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

#Now subsetting the given data according to condition

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= ("2007-2-2"))

#generating a datetime variable which store date and time together to plot the 2nd graph

date_time <- paste(data$Date,data$Time)

#now creating a new column in given dataset

data$date_time <- date_time

#formatting date_time column

data$date_time <- as.POSIXct(date_time)

with(data, {
  plot(data$Sub_metering_1~date_time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(data$Sub_metering_2~date_time,col='Red')
  lines(data$Sub_metering_3~date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
