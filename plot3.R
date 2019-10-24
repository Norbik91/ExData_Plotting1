
## Download and unzip .txt Data File
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "household_power_consumption.zip"
download.file(url, destfile = filename)
unzip(filename)
if (file.exists(filename)) 
      #Delete file if it exists
      file.remove(filename)

## Read Data
household <- read.table("household_power_consumption.txt",
                        sep = ";", dec = ".", header = TRUE, na.strings = "?")

## Subset data for dates of interest: (2007-02-01; 2007-02-02)
df <- subset(household, Date == '1/2/2007' | Date == '2/2/2007')

## Convert Date and Time columns to one DateTime formatted column
DateTime <- paste(df$Date, df$Time, sep = " ")
DateTime <- strptime(DateTime, format = '%e/%m/%Y %H:%M:%S')
df <- cbind(DateTime, df[c(-1,-2)])


####      Plot3

## Create graphics device to plot into png file 'plot3.png' 480x480px
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## create plot as shown in the example
with(df, plot(DateTime, Sub_metering_1,
              xlab = "",
              ylab = "Energy sub metering", type = "n"))
with(df, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(df, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(df, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## close graphics device
dev.off()


df$Sub_metering_1




