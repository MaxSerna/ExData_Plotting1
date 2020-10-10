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

# Plot 3
png('Plot 3.png')
plot(data$Time,
     data$Sub_metering_1,
     xlab = '',
     ylab = 'Energy sub metering',
     type = 'l')
lines(data$Time,
      data$Sub_metering_2,
      col = 'red')
lines(data$Time,
      data$Sub_metering_3,
      col = 'blue')
legend('topright',
       legend = c('Sub_metering_1',
                  'Sub_metering_2',
                  'Sub_metering_3'),
       col = c('black',
               'red',
               'blue'),
       lty = 'solid')
dev.off()