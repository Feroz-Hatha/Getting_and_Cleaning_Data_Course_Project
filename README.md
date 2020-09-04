# Getting_and_Cleaning_Data_Course_Project #

This is the repository that was created as a part of the requirements for the course 'Getting and Cleaning Data' . It includes an R file that reads a dataset and outputs a tidy dataset by carrying out the specified operations on the input dataset, the tidy dataset itself, and a codebook that explains the different variables in the tidy dataset and also the transformations carried out to obtain the same.

## Dataset provided as the input ##

[Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

A detailed description of the dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"). 

## Files in the repository ##

* `run_analysis.R` contains the R code that carries out the analysis required to obtain a tidy dataset from the input. Following are the transformations/opertions carried out to get a tidy dataset as the output:  
  * Merged the training and the test sets to create one data set.
  * Extracted only the measurements on the mean and standard deviation for each measurement.
  * Used descriptive activity names to name the activities in the data set.
  * Appropriately labeled the data set with descriptive variable names.
  * From the data set in the previous step, created a second, independent tidy data set with the average of each variable for each activity and each subject.

* `Tidy_data.txt` is the tidy dataset obtained as the result/output of running run_analysis.R. 

* `CodeBook.md` describes the variables, the data, and any transformations or work that I carried out to clean up the data.

