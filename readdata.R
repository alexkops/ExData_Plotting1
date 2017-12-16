library(dplyr)
# If not yet happened, download data zip file
if(!file.exists("source.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest ="source.zip")
}
# If not yet happened, unzip datafile and load as data frame
datafile = file.path("data","household_power_consumption.txt")
if(!file.exists(datafile)) {
  unzip(zipfile = "source.zip", exdir = "data")
}
rawdata <- read.csv(datafile, sep=";", as.is=TRUE, na.strings = "?")

# Use dplyr to convert the date column from char to Date, then filter only the dates needed and finally 
# constructing a new DateTime column by concatenating Date+Time
data <- tbl_df(rawdata) %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) %>%
  mutate(DateTime = as.POSIXct(paste(Date, Time, sep=" "), "%d/%m/%y %H:%M%:%S"))
# Delete rawdata to free up memory
rm(rawdata)