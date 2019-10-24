
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


####      Plot2

## Create graphics device to plot into png file 'plot2.png' 480x480px
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## create plot as shown in the example
with(df, plot(Global_active_power ~ DateTime,
              xlab = "",
              ylab = "Global Active Power (kilowatts)", type = "l"))

## close graphics device
dev.off()







