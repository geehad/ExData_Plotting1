dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"


df_total <- read.table(file = dataFile,header = TRUE,sep = ';')
df_subset <- df_total[df_total$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power_numeric <- as.numeric(df_subset$Global_active_power)
png("plot1.png",height = 480, width = 480)
hist(Global_active_power_numeric, col="red", xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
