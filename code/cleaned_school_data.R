install.packages("readxl")
library(readxl)

data<- read_excel("/Users/caranix/Documents/edgerrymn/enrollment_public_file_2019.xlsx", sheet= "School")

data<- as.data.frame(data)
class(data)
#df097[df097$STATENAME == "Vermont"]

data_cut<- data[which(data$Grade == "All Grades"),]
#mydata[which(mydata$gender=='F' & mydata$age > 65), ]
#strsplit("hello dolly", " ")

string_elementary_help<- function(name) {
  last<- tail(strsplit(name, " ")[[1]],1)
  #print(last)
  if (last == "ELEMENTARY" || last == "elementary" || last ==  "Elementary") {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

elementary_data <- vector() 
for (i in 1:nrow(data_cut)){
  school_name <- data_cut[i, ]$`School Name`
  if (string_elementary_help(school_name) == TRUE) { 
    #print('here')
    elementary_data <- rbind(elementary_data, data_cut[i, ])
    }
}


#elementary_cut <- data_cut[which(string_elementary_help(data_cut$`School Name` == TRUE)), ]
                                
                                