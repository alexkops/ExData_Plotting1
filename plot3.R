# Shared code to download and read in the neccessary data
source("readdata.R")
# Set locale to English, so that the labels on the x Axis are in english
loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

png(filename="plot3.png")
with(data, {
  plot(Sub_metering_1 ~ DateTime, type="l", ylab = "Energy sub metering", xlab="")
  points(Sub_metering_2 ~ DateTime, type="l", col="red")
  points(Sub_metering_3 ~ DateTime, type="l", col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1)
dev.off()

Sys.setlocale("LC_TIME", loc)