
src <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\Source_Classification_Code.rds")
data <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\summarySCC_PM25.rds")

coal_data <- src[grep("Coal",src$Short.Name),]
coal_emissions <- data[ data$SCC %in% coal_data$SCC,]

coal_emissions <- with(coal_emissions,aggregate(Emissions,by=list(year),sum))
png("plot4.png",width=480,height=480)
plot(coal_emissions,main="Emissions from Coal Combustion Sources",xlab="year"
     ,ylab="emissions",pch=20,lty=1,type="o")
dev.off()