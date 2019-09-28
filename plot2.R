dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

df_total <- read.table(file = dataFile,header = TRUE,sep = ';')
df_subset <- df_total[df_total$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(df_subset$Date, df_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power_numeric <- as.numeric(df_subset$Global_active_power)

png("plot2.png",height = 480, width = 480)
plot(datetime, Global_active_power_numeric,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
