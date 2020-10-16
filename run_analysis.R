run_analysis <- function(){
  
  features <- read.table("data/features.txt")
  
  xTest <- read.table("data/test/X_test.txt")
  yTest <- read.table("data/test/y_test.txt")
  subject_test <- read.table("data/test/subject_test.txt")
  
  xTraining <- read.table("data/train/X_train.txt")
  yTraining <- read.table("data/train/y_train.txt")
  subject_train <- read.table("data/train/subject_train.txt")
  
  
  x <- rbind(xTest, xTraining)
   
  colnames(x) <- features$V2
  
    sub <- rbind(subject_test,subject_train)	
    colnames(sub) <- "Subject"
  
  y <- rbind(yTest, yTraining)	
  colnames(y) <- "Activity"
  
  
  y[y == 1] = "Walking"
  y[y == 2] = "Walking_Upstairs"
  y[y == 3] = "Walking_Downstairs"
  y[y == 4] = "Sitting"
  y[y == 5] = "Standing"
  y[y == 6] = "Laying"
  
  
  rawData <- cbind(x,sub,y)
  
  
  meanCols <- getColumnNames("Mean",rawData)
  stdCols <- getColumnNames("std",rawData)
  
  
  meanCsv <- rawData[,meanCols]
  stdCsv <- rawData[,stdCols]
  
  
  meanAndStd <- cbind(meanCsv,stdCsv,sub,y)
  
  
  averages <- aggregate(meanAndStd, list(Activity = meanAndStd$Activity, Subject =  meanAndStd$Subject), mean)
  
  
  length <- ncol(averages)
  averages[length] <- NULL
  averages[length-1] <- NULL
  
  
  write.table(averages, file="wearable-tidy-data.txt", row.name=FALSE)
}

getColumnNames <- function(string, data){
   
  stringColNames <- ""
  
  colnames <- c(colnames(data))
  
  stringLocation <- grep(string, colnames)
  
  for(i in stringLocation){
    stringColNames <- c(stringColNames, colnames(data[i]))
  }
  
  stringColNames <- stringColNames[stringColNames != ""]
  
  return(stringColNames);
}