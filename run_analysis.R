run_analysis <- function(){
# setwd("C:/Users/Farzad/Dropbox/Data Science Toolbox/Course 3 Getting and Cleaning Data/CourseProject/UCI HAR Dataset")
  
# Read activity and feature labels
Activity <- read.table("./activity_labels.txt")
Features <- read.table("./features.txt")

# Read test data
TestData <- read.table("./test/X_test.txt")
TestActivity <- read.table("./test/y_test.txt")
TestSubjects <- read.table("./test/subject_test.txt")

# Read training data
TrainData  <- read.table("./train/X_train.txt")
TrainActivity<- read.table("./train/y_train.txt")
TrainSubjects <- read.table("./train/subject_train.txt")

# Merge test and train Data and give appropriate names
  AllData <- rbind(TrainData, TestData)
  # Extracts only the measurements on the mean and standard deviation for each measurement.
  MeanStdData <- AllData[,grep("mean\\(\\)|std\\(\\)", Features$V2)]
  names(MeanStdData) <- Features[grep("mean\\(\\)|std\\(\\)", Features$V2),2]

  AllActivity <- rbind(TrainActivity, TestActivity)
  names(AllActivity) <- c("activity")
  AllSubjects <- rbind(TrainSubjects, TestSubjects)
  names(AllSubjects) <- c("subject")
  Data = cbind(MeanStdData, AllSubjects, AllActivity)
# Use descriptive activity names to name the activities in the data set and Appropriately label the data set with descriptive variable names.
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))
names(Data) <- gsub("\\()", "", names(Data))
# independent tidy data set with the average of each variable for each activity and each subject.
TidyData<-aggregate(. ~subject + activity, Data, mean)
TidyData<-TidyData[order(Data2$subject,Data2$activity),]
write.table(TidyData, file = "TidyData.txt",row.name=FALSE)
}