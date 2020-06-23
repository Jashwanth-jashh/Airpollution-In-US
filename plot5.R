src <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\Source_Classification_Code.rds")
data <- readRDS("C:\\Users\\KADEM JASHWANTH\\Documents\\course_4_final_proj\\summarySCC_PM25.rds")


vehicle <- src[ grep("Vehicle",src$Short.Name), ]
vehicle_emission <- data[data$SCC %in% vehicle$SCC,]

vehicle_emission<- with(vehicle_emission,aggregate(Emissions,by=list(year),sum))

png("plot5.png",width=480,height = 480)

plot(vehicle_emission,main="Emission due to Vehicle Sources",xlab="year"
     ,ylab="emission",lty=1,pch=20,type="o")
dev.off()