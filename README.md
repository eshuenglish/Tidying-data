# Tidying-data
Data Science Coursera
This repository is the project for the Coursera Data Science Specialization Course 3: Getting and Cleaning Data The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

# CONTENT
The following files can be found in this repository

README.md (the current file) explains the content of each file

CodeBook.md is a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data (an overview is outlined above under the run_analysis.R description)

The tidyData.txt is a tidy data set that has the mean and standard deviation for each measurments with the subject ID and the activities performed.

The tidyMeanData.txt is a tidy data set that has the average of all variables grouped by subject ID and the activities performed

run_analysis.R is a R script that does the following:

merges the training and the test sets to create one data set
extracts only the measurements on the mean and standard deviation for each measurement
uses descriptive activity names to name the activities in the data set
labels the data set with descriptive variable names
creates a second, independent tidy data set with the average of each variable for each activity and each subject
