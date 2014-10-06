## Raw Data source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" 
<br>A full description is available at the site where the data was obtained: 
<br>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
<br>Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
<br>Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
<br>The experiments have been video-recorded to label the data manually. 
<br>The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
<br>
<br>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
<br>The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.
<br>The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
<br>From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
<br>See 'features_info.txt' for more details. 
<br>
<br>For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
<br>
<br>The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
<br>
<br>The following files are available for the train and test data. 
<br>Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
<br>
<br>Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
<br>
<br>
## Data Transformation
From above Raw Data Source, we used run_analysis.R to 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Description of the variables in the output tidy dataset:

subject_id: a number identifying the subject (or person) who performed the activity. Its range is from 1 to 30.
activityName: identify the activity the subject was performing. They are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 

Below are the 67 numeric variables representing the average of a mean or standard deviation variable over the subject / activity combination. 
The "t" prefix denotes Time Domain, while "f" prefix denotes Frequency Domain.
They were not named in full as it will make the fields too long.

Each of the variables has the word "Mean" or "StdDev" embedded and are used to denote "Mean value" and "Standard deviation" respectively.
The "X, Y or Z" ending letters are used to denote 3-axial signals in the X, Y and Z directions.


The 67 numeric variables are:

 [1] "tBodyAccMeanX"                 "tBodyAccMeanY"                 "tBodyAccMeanZ"                 "tGravityAccMeanX"             
 [5] "tGravityAccMeanY"              "tGravityAccMeanZ"              "tBodyAccJerkMeanX"             "tBodyAccJerkMeanY"            
 [9] "tBodyAccJerkMeanZ"             "tBodyGyroMeanX"                "tBodyGyroMeanY"                "tBodyGyroMeanZ"               
[13] "tBodyGyroJerkMeanX"            "tBodyGyroJerkMeanY"            "tBodyGyroJerkMeanZ"            "tBodyAccMagMean"              
[17] "tGravityAccMagMean"            "tBodyAccJerkMagMean"           "tBodyGyroMagMean"              "tBodyGyroJerkMagMean"         
[21] "fBodyAccMeanX"                 "fBodyAccMeanY"                 "fBodyAccMeanZ"                 "fBodyAccJerkMeanX"            
[25] "fBodyAccJerkMeanY"             "fBodyAccJerkMeanZ"             "fBodyGyroMeanX"                "fBodyGyroMeanY"               
[29] "fBodyGyroMeanZ"                "fBodyAccMagMean"               "fBodyAccJerkMagMean"           "fBodyGyroMagMean"             
[33] "fBodyGyroJerkMagMean"          "angleOftBodyAccMeanAndGravity" "tBodyAccStdDevX"               "tBodyAccStdDevY"              
[37] "tBodyAccStdDevZ"               "tGravityAccStdDevX"            "tGravityAccStdDevY"            "tGravityAccStdDevZ"           
[41] "tBodyAccJerkStdDevX"           "tBodyAccJerkStdDevY"           "tBodyAccJerkStdDevZ"           "tBodyGyroStdDevX"             
[45] "tBodyGyroStdDevY"              "tBodyGyroStdDevZ"              "tBodyGyroJerkStdDevX"          "tBodyGyroJerkStdDevY"         
[49] "tBodyGyroJerkStdDevZ"          "tBodyAccMagStdDev"             "tGravityAccMagStdDev"          "tBodyAccJerkMagStdDev"        
[53] "tBodyGyroMagStdDev"            "tBodyGyroJerkMagStdDev"        "fBodyAccStdDevX"               "fBodyAccStdDevY"              
[57] "fBodyAccStdDevZ"               "fBodyAccJerkStdDevX"           "fBodyAccJerkStdDevY"           "fBodyAccJerkStdDevZ"          
[61] "fBodyGyroStdDevX"              "fBodyGyroStdDevY"              "fBodyGyroStdDevZ"              "fBodyAccMagStdDev"            
[65] "fBodyAccJerkMagStdDev"         "fBodyGyroMagStdDev"            "fBodyGyroJerkMagStdDev"        

