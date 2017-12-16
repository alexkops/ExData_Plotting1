# Shared code to download and read in the neccessary data
source("readdata.R")
# Set locale to English, so that the labels on the x Axis are in english
loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

png(filename="plot2.png")
with(data, plot(Global_active_power ~ DateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()

Sys.setlocale("LC_TIME", loc)