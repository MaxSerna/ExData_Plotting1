rm(list = ls())

getwd()

data <- read.csv(unz('data.zip',
              'household_power_consumption.txt'),
         sep = ';',
         na.strings = '?')

data <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

data$Time <- strptime(paste(data$Date,
                            data$Time),
                      format = "%d/%m/%Y %H:%M:%S")

# Plot 1
png('Plot 1.png')
hist(data$Global_active_power,
     col = 'red',
     main = 'Global Active Power',
     xlab = 'Globar Active Power (kilowatts)')
dev.off()