# Getting and Cleaning Data Course Project Codebook #
## Input Data ##
The data to be tidied were taken from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), which is basically a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. More information about this dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
## Steps carried out to obtain a tidy dataset ##
1. **Downloaded the given data**
    * Downloaded the zip file provided in the course website and extracted it to the course project folder to obtain the folder 'UCI HAR Dataset'.
2. **Read the required data**
    * Read the components of training and test datasets separately
      * `X_train`, `y_train`, and `subject_train` constitute the training data (70% of the total data available), which represent the measurements of the features considered, activity labels, and the subject id.
      * `X_test`, `y_test`, and `subject_test` correspond to the same measurements as above, but for the testing set (the remaining 30% of the entire data).
      * `features` correspond to the various features measured for the subjects considered. These also consitute the columns of `X_train` and `X_test` data frames.
3. **Merged the training and test datasets to create one dataset**
    * First of all, `X_train`, `y_train`, and `subject_train` are merged together to form the training dataset, `training_data`. Similarly, `X_test`, `y_test`, and `subject_test` are merged together to form the test dataset, `test_data`.
    * The variables (columns) in `training_data` and `test_data` are  named in accordance with the elements of `features` dataset.
    * Finally, `training_data` and `test_data` are merged to form a single dataset, `merged_data`.
4. **Extracted only the measurements on the mean and standard deviation for each measurement**
    * Using the `grep()` function, subsetted `merged_data` using only the measurements on the mean and standard deviation for each measurement. The result was stored to a new dataset, `sub_data`.
5. **Used descriptive activity names to name the activities in the data set**
    * The activity labels in the `Activity` column of `sub_data` were replaced with their corresponding descriptive names contained in `features` dataset.
6. **Appropriately labeled the data set with descriptive variable names**
    * The names of the features were modified appropriately to make them more understandable. The following modifications were made to the names of the features:
      * Removed any paranthesis symbol in the names.
      * `Acc` was replaced with `Accelerometer`, `Gyro` was replaced with `Gyroscope`, and `Mag` was replaced with`Magnitude`.
      * `tBody` was replaced with `TimeBody`, and `BodyBody` was relaced with `Body`.
      * `angle` was replaced with `Angle`, and `gravity` was replaced with `Gravity`. 
      * `-mean()` was replaced with `Mean`, `-std()` was replaced with`Std_Deviation`, and `-freq()` was replaced with `Frequency`.
      * A `t` in the beginning was replaced with `Time`, and a `f` in the beginning was replaced with `Frequency`.
7. **From the data set in the previous step, created a second, independent tidy data set with the average of each variable for each activity and each subject**
    * `Tidy_data` was obtained by grouping `sub_data` by `Subject` and `Activity`, and then by summarizing using the average of each variable.
    * `Tidy_data.txt` was created by the application of `write.table()` to `Tidy_data` with `row.names` set equal to `FALSE`.
