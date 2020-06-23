src <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\Source_Classification_Code.rds")
data <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\summarySCC_PM25.rds")

baltimore <- subset(data,fips=="24510")
LA <- subset(data,fips=="06037")


vehicle <- src[grep("Vehicle",src$Short.Name),]
baltimore <- baltimore[baltimore$SCC %in% vehicle$SCC,]
LA <- LA[LA$SCC %in% vehicle$SCC,]

baltimore <- with(baltimore,aggregate(Emissions,by=list(year),sum))
LA <- with(LA,aggregate(Emissions,by=list(year),sum))


names(baltimore) <- c("year","emission")
names(LA) <- c("year","emission")

baltimore$county <- rep("baltimore",4)
LA$county <- rep("LA",4)
 
new_data <- rbind(baltimore,LA)

png("plot6.png",width=480,height=480)
library(ggplot2)
plt <- qplot(year,emission,data=new_data,color=county)+geom_smooth()+labs(title="Baltimore vs LA Vehicle Source Emission")
print(plt)
dev.off()