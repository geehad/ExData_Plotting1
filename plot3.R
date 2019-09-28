dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

df_total <- read.table(file = dataFile,header = TRUE,sep = ';')
df_subset <- df_total[df_total$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(df_subset$Date, df_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

Sub_metering_1_numeric <- as.numeric(df_subset$Sub_metering_1)
Sub_metering_2_numeric <- as.numeric(df_subset$Sub_metering_2)
Sub_metering_3_numeric <- as.numeric(df_subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1_numeric, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2_numeric, type="l", col="red")
lines(datetime, Sub_metering_3_numeric, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
