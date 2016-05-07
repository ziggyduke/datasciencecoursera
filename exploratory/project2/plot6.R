if (!exists("NEI") | !exists("SCC"))
{
  source("get_data.R")
}
png(filename = "plot6.png", width = 480, height = 480)

par( mfrow = c(1, 1))

vehicle <- filter(SCC, grepl("Vehicle",SCC.Level.Two))

baltimore <- filter(NEI, fips == "24510")
la <- filter(NEI, fips == "06037")

motor_baltimore <- inner_join(vehicle, baltimore, by='SCC')
motor_baltimore_sel <- select(motor_baltimore, Emissions, year)

motor_la <- inner_join(vehicle, la, by='SCC')
motor_la_sel <- select(motor_la, Emissions, year)

la_sum <- group_by(motor_la_sel, year)
la_sum <- summarize(la_sum, s = sum(Emissions))
la_sum["City"] <- "Los Angeles"

baltimore_sum <- group_by(motor_baltimore_sel, year)
baltimore_sum <- summarize(baltimore_sum, s = sum(Emissions))
baltimore_sum["City"] <- "Baltimore"

tot <- rbind(la_sum, baltimore_sum)

print(qplot(year, s, data = tot, col=City, geom="line", 
            ylab="PM2.5 Emissions (tons)",
            xlab="Year",
            main="PM2.5 emissions in Baltimore and Los Angeles for Motor Vehicles"))


dev.off()
