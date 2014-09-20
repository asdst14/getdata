##You should create one R script called run_analysis.R that does the following. 
##1 Merges the training and the test sets to create one data set.
##2 Extracts only the measurements on the mean and standard deviation for each measurement. 
##3 Uses descriptive activity names to name the activities in the data set
##4 Appropriately labels the data set with descriptive variable names. 
##5 From the data set in step 4, creates a second, independent tidy data set with the average 
##  of each variable for each activity and each subject.

library(plyr)
library(dplyr)
library(tidyr)

## Preparation for TASK 1
## Read raw data from the working directory
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Read subject data from the working directory
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read activity data from the working directory
act_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
act_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Read labels from the working directory
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(act_labels) <- c("activity_id", "activity")
ftr <- read.table("./UCI HAR Dataset/features.txt")

## Combine train and test partitions
raw <- rbind(train, test)
subject <- rbind(sub_train, sub_test)
activity <- rbind(act_train, act_test)

## TASK 1
## Create one dataset
data <- cbind(raw, subject, activity)

## TASK 4
## Label columns of the dataset
ftr <- rbind(ftr, data.frame(V1=c("562", "563"), V2=c("subject", "activity_id")))
names(data) <- ftr$V2

## TASK 2 
## Extract measurements on the mean and std
data_mean <- select(data, contains("mean()"))
data_std <- select(data, contains("std()"))

## Combine columns
data2 <- cbind(data$subject, data$activity_id, data_mean, data_std)
colnames(data2)[1] <- c("subject")
colnames(data2)[2] <- c("activity_id")

## TASK 3
## Integrate activity labels instead of ids
data3 <- join(act_labels, data2, by="activity_id")    ### optional: mapvalues()
data3 <- select(data3, -activity_id)

## TASK 5
## create tidy data set with the mean of each variable for each activity and each subject
data3 <- tbl_df(data3)
data3 <- group_by(data3, subject, activity)
tidydata <- summarise_each(data3, funs(mean))
write.table(tidydata, file="./tidydata.txt", row.name=FALSE)