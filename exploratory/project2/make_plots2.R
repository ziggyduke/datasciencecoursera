
baltimore <- filter(NEI, fips == "24510")
baltimore <- select(baltimore, Emissions, year)

baltimore_group <- group_by(baltimore, year)
baltimoresum <- summarize(baltimore_group, total_emissions=sum(Emissions))
plot(baltimoresum)