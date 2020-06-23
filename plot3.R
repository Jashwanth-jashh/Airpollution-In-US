
src <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\Source_Classification_Code.rds")
data <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\summarySCC_PM25.rds")

p3 <- subset(data,fips=="24510")
nonroad <- subset(p3,type=="NON-ROAD")
onroad <- subset(p3,type=="ON-ROAD")
point<- subset(p3,type=="POINT")
nonpoint <- subset(p3,type=="NONPOINT")

nonroad<- with(nonroad,aggregate(Emissions,by=list(year),sum))
onroad<- with(onroad,aggregate(Emissions,by=list(year),sum))
point<- with(point,aggregate(Emissions,by=list(year),sum))
nonpoint<- with(nonpoint,aggregate(Emissions,by=list(year),sum))


nonroad$type <- rep("nonroad",4)
onroad$type <- rep("onroad",4)
point$type <- rep("point",4)
nonpoint$type <- rep("nonpoint",4)

p3 <- rbind(nonroad,onroad,point,nonpoint)
names(p3)<-c("year","emission","type")
png("plot3.png",width=480,height=480)

library(ggplot2)
plt <- qplot(year,emission,data=p3,color=type)+geom_smooth()+labs(title="Emission in Baltimore based on type")
print(plt)
dev.off()