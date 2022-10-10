######################## FIX GEOID 

dat<- read.csv("/Users/caranix/OneDrive - The Ohio State University/edgerrymn/census_block_median_income/ACSDT5Y2019.B19013_data_with_overlays_2021-06-10T123220.csv")
dat[,1]
splt<- strsplit(dat[,1], "US")

v<- vector() 
for (i in 1:length(splt)) { 
  v[i]<- splt[[i]][2]
}

dat["GEOID10"] <- v
dat
dat2<- dat[-1,]

write.csv(dat2, "2019MedianHHIncomebyBG.csv")

#B19013_001E	Estimate!!Median household income in the past 12 months (in 2019 inflation-adjusted dollars)
#B19013_001M	Margin of Error!!Median household income in the past 12 months (in 2019 inflation-adjusted dollars)

#joined in QGIS to create /Users/caranix/OneDrive - The Ohio State University/edgerrymn/2010BG_joinedHHincome/2010BG_joinedHHincome.shp 


####################### Now fix SD numbering- check uniqueness 
library(readxl)
dat2<- read_excel("/Users/caranix/OneDrive - The Ohio State University/edgerrymn/MN_money_District_levelcopy.xlsx")

colnames_right<-dat2[2,]  
colnames(dat2)<- colnames_right
dat2<- dat2[-1:-2,]

#now Aitkin & MPLS have same District #, change for joining purposes- hand edited in .shp 

dat2["\r\nDISTRICT\r\nNUMBER"]

dat2$(1, "\r\nDISTRICT\r\nNUMBER") #<- value


dat2[1,3]<- "0001a"
dat2[2,3]<- "0001b"

dat2<- as.data.frame(dat2)
write.csv(dat2, "2019SDMoney.csv")

class(dat2[,3])


