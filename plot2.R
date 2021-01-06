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

# Plotting the second Graph as given in the assignment

plot(data$Global_active_power~data$date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#plotting the graph and saving it

dev.copy(png,file = "plot2.png",width = 480, height = 480)
dev.off()



