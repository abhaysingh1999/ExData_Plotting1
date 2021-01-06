#Reading The Data 
data <- read.table("C:/Users/abhay/Desktop/COURSERA/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
# Now changing the class of Date from character to Date class
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

#Now subsetting the given data according to condition
data <- subset(data, Date >= as.Date("2007-2-1") & Date <= ("2007-2-2"))

# Plotting the first Graph as given in the assignment
#plotting a Histogram of Global_active_power 

hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")

#now creating a png file for plot1
dev.copy(png,file = "plot1.png")
dev.off()
