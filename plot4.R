# Shared code to download and read in the neccessary data
source("readdata.R")

# Set locale to English, so that the labels on the x Axis are in english
loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

png(filename="plot4.png")

# Make a plot with four graphs
par(mfrow=c(2,2))

# Same as in plot2.R
with(data, plot(Global_active_power ~ DateTime, type="l", ylab = "Global Active Power", xlab=""))

# New Plot
with(data, plot(Voltage ~ DateTime, type = "l"))

# Same as in plot3.R
with(data, {
  plot(Sub_metering_1 ~ DateTime, type="l", ylab = "Energy sub metering", xlab="")
  points(Sub_metering_2 ~ DateTime, type="l", col="red")
  points(Sub_metering_3 ~ DateTime, type="l", col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1, bty="n")

# New Plot
with(data, plot(Global_reactive_power ~ DateTime, type = "l"))

dev.off()

Sys.setlocale("LC_TIME", loc)