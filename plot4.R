dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

df_total <- read.table(file = dataFile,header = TRUE,sep = ';')
df_subset <- df_total[df_total$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(df_subset$Date, df_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

Global_active_power_numeric <- as.numeric(df_subset$Global_active_power)
Voltage_numeric <- as.numeric(df_subset$Voltage)
Sub_metering_1_numeric <- as.numeric(df_subset$Sub_metering_1)
Sub_metering_2_numeric <- as.numeric(df_subset$Sub_metering_2)
Sub_metering_3_numeric <- as.numeric(df_subset$Sub_metering_3)
Global_reactive_power_numeric <- as.numeric(df_subset$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2)) 

plot(datetime, Global_active_power_numeric, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, Sub_metering_1_numeric, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2_numeric, type="l", col="red")
lines(datetime, Sub_metering_3_numeric, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, Voltage_numeric, type="l", xlab="datetime", ylab="Voltage")


plot(datetime, Global_reactive_power_numeric, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
