---
title: "Code Book"
author: "Eshu"
date: "27 March 2021"
output:
  word_document: default
  pdf_document: default
  html_document: default
---



INTRODUCTION
-------------

This codebook describes the cleaning/ tidying up the raw data and description of variables in tidyData.txt


ANALYSIS PIPELINE
------------------
###Step 1: Reading all files and mergining the data.

label files: activity_labels.txt and features.txt
training data: subject_test.txt, X_test.txt, and y_test.txt
test data: subject_train.txt, X_train.txt, and y_train.txt

-  Read above files and set the column names; for X_train, X_test used column names from feature names in features.txt
-  merged the three training set files by column into a training data frame
-  merged the three test set files by column into a test data frame
-  merged the training data and test data by rows into a data frame

###Step 2: Extracting only the mean and standard deviation of the measurements.
-  Used grep to identify the column numbers containing keywords 'mean' or 'std' 
-  Kept the subject =id and acivity columns and subsetted the columns which had 'mean' or 'std' (obtained from previous step)

###Step 3: Used descriptive activity names to name the activities in the data set.
-  Changed the activity columns to descriptive activities name as provided in the activities_labels.txt loaded earlier

###Step 4: Appropriately labeled the data set with descriptive variable names. 
-  Removed the parenthesis in the column names to make it cleaner and easier to interpret

###Step 5:Created a second, independent tidy data set with the average of each variable for each activity and each subject.
-  Loaded dplyr package and used it ti group the data setby subject id and activity
-  summarised the grouped dataset and calulated the avergae for each variable


FEATURE SELECTION
-------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.



FEATURE VARIABLES
------------------
###a) Time Signals
-  tBodyAcc-XYZ
-  tGravityAcc-XYZ
-  tBodyAccJerk-XYZ
-  tBodyGyro-XYZ
-  tBodyGyroJerk-XYZ
-  tBodyAccMag
-  tGravityAccMag
-  tBodyAccJerkMag
-  tBodyGyroMag
-  tBodyGyroJerkMag

###b) Frequency Signals
-  fBodyAcc-XYZ
-  fBodyAccJerk-XYZ
-  fBodyGyro-XYZ
-  fBodyAccMag
-  fBodyAccJerkMag
-  fBodyGyroMag
-  fBodyGyroJerkMag

Mean and Standard Varibles for these signals grouped by Subject ID and activity was calculated



OTHER VARIABLES
----------------

SubjectID: Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

activity: Six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) that the subjects performed wearing a smartphone (Samsung Galaxy S II) on the waist. 




REFERENCE
-----------
The Dataset used was taken from:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 








