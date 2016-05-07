if (!exists("NEI") | !exists("SCC"))
{
  source("get_data.R")
}
png(filename = "plot5.png", width = 480, height = 480)

par(mfrow = c(1, 1))

vehicle <- filter(SCC, grepl("Vehicle",SCC.Level.Two))
baltimore <- filter(NEI, fips == "24510")
motor_baltimore <- inner_join(vehicle, baltimore, by='SCC')
motor_baltimore_sel <- select(motor_baltimore, Emissions, year)
baltimore_sum <- group_by(motor_baltimore_sel, year)
baltimore_sum <- summarize(baltimore_sum, s = sum(Emissions))
plot(baltimore_sum, type='o', ylab='PM2.5 Emissions (tons)', xlab='Year', 
     main='Motor Vehicle related PM2.5 emissions in Baltimore')
dev.off()
