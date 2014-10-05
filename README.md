Getting-and-Cleaning-Data
=========================

Repository for Getting and Cleaning Data Project

### Purpose
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In this repo, you will find one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Preparing and studying the data
Prior to running, we studied the data in the zip files.
From the unzipped UCI HAR Dataset, we read the files and their dim()

* 'train/y_train.txt': Training labels
  * with rows=7352  col=1
* 'train/subject_train.txt': Training subjects who performed the activity
  * with  rows=7352  col=1
* 'test/y_test.txt': Test labels.
  * with  rows=2947  col=1
* 'test/subject_test.txt': Test subjects who performed the activity.
  * with  rows=2947  col=1
* 'train/X_train.txt': Training set.
  * with  rows=7352  col=561
* 'test/X_test.txt': Test set.
  * with  rows=2947  col=561
* 'features.txt': List of all features.
  * with  rows=561  col=2
* 'activity_labels.txt': Links the class labels with their activity name.
  * with  rows=6  col=2

From above, we can deduce the structure of the dataset we need to build


| **variable_names** | features.txt | **Subject** | **Activity** |
| ------------------ |:------------:| -----------:| ------------:|
| **data**           | X_train.txt | subject_train.txt | y_train.txt |

