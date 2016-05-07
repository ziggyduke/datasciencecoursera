if (!exists("NEI") | !exists("SCC"))
{
  source("get_data.R")
}
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(1, 1)) 

coal <- filter(SCC, grepl("Coal",SCC.Level.Three))
coal_comb <- filter(coal, grepl("Combustion",SCC.Level.One))

coal_nei <- inner_join(NEI, coal_comb, by='SCC')

coal_nei_sel <- select(coal_nei, Emissions, year)
coal_usa <- group_by(coal_nei_sel, year)

coal_usa_sum <- summarize(coal_usa, coal_sum = sum(Emissions))
plot(coal_usa_sum, type='o', ylab='PM2.5 Emissions (tons)', xlab='Year', 
     main='Coal combustion related PM2.5 emissions in United States')
dev.off()
