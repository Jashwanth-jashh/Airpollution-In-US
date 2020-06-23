src <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\Source_Classification_Code.rds")
data <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\summarySCC_PM25.rds")
 


p1<- with(data,aggregate(Emissions,by=list(year),sum))
png("Plot1.png",width=480,height=480)
plot(p1,main="Total Emissions ",xlab="Year",ylab="PM25 Emissions",pch=19,lty=1,type="o")

dev.off()