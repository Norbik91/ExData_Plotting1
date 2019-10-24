
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


####      Plot1

## Create graphics device to plot into png file 'plot1.png' 480x480px
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## create plot as shown in the example
with(df, hist(Global_active_power, col = "red", main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)",
              ylab = "Frequency"))

## close graphics device
dev.off()







