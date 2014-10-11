#########################################
##
## start of run_analysis.R
##
#########################################

print("start of run_analysis.R ... ")

# install and load package dplyr
require("dplyr")
library(dplyr)

# set working directory accordingly
# wd_path is set to the location where the UCI HAR Dataset was unzipped.
# change this variable accordingly to run in your environment
wd_path <- "C:/getdata-007/UCI HAR Dataset/"  
setwd(wd_path)

#########################################
## 1. Merge the training and the test sets to create one data set.
## From initial studies, we see that we need to rbind train/X_train.txt and test/X_test.txt
## since both have same 561 columns, and features.txt is the header
## From the unzipped UCI HAR Dataset/README.txt, we read that
## "features.txt" stores the column names
## (Each feature vector is a row on the text file.)
#########################################

# read the training set
train_path <- paste(wd_path, "train/X_train.txt", sep="")
trainraw <- read.table(train_path, header=FALSE)

# read the test set
test_path <- paste(wd_path, "test/X_test.txt", sep="")
testraw <- read.table(test_path, header=FALSE)

# Merges the training and the test sets to create one data set
merge <- rbind(trainraw, testraw)

# extract the column names 
features_path <- paste(wd_path, "features.txt", sep="")
featuresraw <- read.table(features_path, header=FALSE)

# set the column names
colnames(merge) <- featuresraw$V2

#########################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#########################################

# we will use dplyr tbl_df
tbl_merge <- tbl_df(merge)

# select data with columns that has the words "mean" and "std", and without "meanFreq", 'gravityMean"
# i am assuming meanFreq and gravityMean are others types of measurement 
data <- select(tbl_merge, contains("mean"), contains("std") , -contains("meanFreq"), -contains("gravityMean") )

#########################################
## 3. Uses descriptive activity names to name the activities in the data set
## From initial studies, we see that y_train and y_test stores the activity
## so we can add this column and name accordingly using the activity_labels.txt
#########################################

# read the activity labels
activitylabels_path <- paste(wd_path, "activity_labels.txt", sep="")
activitylabelsraw <- read.table(activitylabels_path, header=FALSE)

# read the training labels
trainlabel_path <- paste(wd_path, "train/y_train.txt", sep="")
trainlabelraw <- read.table(trainlabel_path, header=FALSE)

# read the test labels
testlabel_path <- paste(wd_path, "test/y_test.txt", sep="")
testlabelraw <- read.table(testlabel_path, header=FALSE)

# Merges the training and test labels to create one data set (similar to above part 1)
mergelabel <- rbind(trainlabelraw, testlabelraw)

# add this mergelabel column to our data
data <- cbind (data, mergelabel)

# add the activity name in data set
# this is the column that stores our descriptive activity names  
data$activityName <- factor(data$V1, levels=activitylabelsraw$V1, labels=activitylabelsraw$V2)

# remove the activity number column V1
data <- select (data, -matches("V1") )

#########################################
## 4. Appropriately labels the data set with descriptive variable names. 
## As the column names are long, decided to use the camel naming notation,
## tidy the names a bit by removing the () and - symbols only
#########################################

names(data) <- gsub("mean","Mean",names(data))
names(data) <- gsub("std","StdDev",names(data))
names(data) <- gsub("\\(","",names(data))
names(data) <- gsub("\\)","",names(data))
names(data) <- gsub("\\-","",names(data))
names(data) <- gsub("angle","angleOf",names(data))
names(data) <- gsub(",gravity","AndGravity",names(data))
names(data) <- gsub("_name","Name",names(data))
names(data) <- gsub("BodyBody","Body",names(data))

#########################################
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
#########################################

# read subject_train
trainsubj_path <- paste(wd_path, "train/subject_train.txt", sep="")
trainsubjraw <- read.table(trainsubj_path, header=FALSE)

# read the subject_test
testsubj_path <- paste(wd_path, "test/subject_test.txt", sep="")
testsubjraw <- read.table(testsubj_path, header=FALSE)

# Merges the training and test subjects to create one data set (similar to above parts)
subjects <- rbind(trainsubjraw , testsubjraw)

# add this subjects column to our data
data <- cbind (data, subjects)

# add the subject_id in data set
# this is the column that stores our subject  
# Each row identifies the subject who performed the activity for each window sample.
# Its range is from 1 to 30. 
data$subject_id <- as.factor(data$V1)

# remove the subjects column V1
data <- select (data, -matches("V1") )

# find average of each variable for each activity and each subject
tidy <- data %.% 
  group_by(subject_id, activityName) %.%  
  summarise_each(funs( mean)) 

# create a file of this tidy data, in the working dir set in beginning of this script
write.table(tidy, file = 'tidy.txt', row.names = FALSE)

# so for this case, you can find this exported file as C:/getdata-007/UCI HAR Dataset/tidy.csv

print("end of run_analysis.R ")

#########################################
## 
## End of run_analysis.R
## 
#########################################
