src <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\Source_Classification_Code.rds")
data <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\summarySCC_PM25.rds")


p2 <- subset(data,fips=="24510")
p2<- with(p2,aggregate(Emissions,by=list(year),sum))

png("Plot2.png",width=480,height=480)
plot(p2,main="Total Emissions in Baltimore ",xlab="Year",ylab="PM25 Emissions",pch=19,lty=1,type="o")

dev.off()