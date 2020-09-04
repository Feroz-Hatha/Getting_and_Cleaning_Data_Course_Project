#Reading the necessary data (assuming that we have 'UCI HAR Dataset' folder in the working directory)
features <- read.table("UCI HAR Dataset/features.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Obtaining the training dataset and naming the columns according to features dataset
training_data <- cbind(subject_train, y_train, X_train)
names(training_data) <- c(c("Subject", "Activity"), features[, 2])

#Obtaining the test dataset and naming the columns according to features dataset
test_data <- cbind(subject_test, y_test, X_test)
names(test_data) <- c(c("Subject", "Activity"), features[, 2])

#Merging the training and test datasets
merged_data <- rbind(training_data, test_data)

#Extracting only the measurements on the mean and standard deviation for each measurement
mean_sd_indices <- grep("mean|std", features[, 2])
sub_data <- merged_data[, c(1, 2, mean_sd_indices + 2)]

#Giving descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
sub_data$Activity <- activity_labels[sub_data$Activity, 2]

#Appropriately labelling the data set with descriptive variable names
names(sub_data) <- gsub("[(][)]", "", names(sub_data))
names(sub_data) <- gsub("Acc", "Accelerometer", names(sub_data))
names(sub_data) <- gsub("Gyro", "Gyroscope", names(sub_data))
names(sub_data) <- gsub("Mag", "Magnitude", names(sub_data))
names(sub_data) <- gsub("tBody", "TimeBody", names(sub_data))
names(sub_data) <- gsub("BodyBody", "Body", names(sub_data))
names(sub_data) <- gsub("angle", "Angle", names(sub_data))
names(sub_data) <- gsub("gravity", "Gravity", names(sub_data))
names(sub_data) <- gsub("-mean()", "Mean", names(sub_data), ignore.case = TRUE)
names(sub_data) <- gsub("-std()", "Std_Deviation", names(sub_data), ignore.case = TRUE)
names(sub_data) <- gsub("-freq()", "Frequency", names(sub_data), ignore.case = TRUE)
names(sub_data) <- gsub("^t", "Time", names(sub_data))
names(sub_data) <- gsub("^f", "Frequency", names(sub_data))

#From the dataset in the previous step, creating a second, independent tidy data set with the average of each variable for each activity and each subject
Tidy_data <- sub_data %>% 
              group_by(Subject, Activity) %>%
              summarise_all(funs(mean))
write.table(Tidy_data, "Tidy_data.txt", row.names = FALSE)
