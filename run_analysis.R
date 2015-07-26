## 1. The next 3 steps merges the data from training and test sets

# Step 1 - Merges the data from training and test sets

train_data <- read.table("train/X_train.txt")
test_data <- read.table("test/X_test.txt")
data <- rbind(train_data, test_data)

# Step 2 - Merges the subject information from training and test sets

train_subject <- read.table("train/subject_train.txt")
test_subject <- read.table("test/subject_test.txt")
subject <- rbind(train_subject, test_subject)

# Step 3 - Merges the activity information from training and test sets

train_activity <- read.table("train/y_train.txt")
test_activity  <- read.table("test/y_test.txt")
activity <- rbind(train_activity, test_activity)


# 2. Extract only the mean and standard deviation for each measurement

features <- read.table("features.txt")

### get two separate sets of columns for std and mean and then combine them.

mean_features<-grep("-mean\\(\\)", features[, 2])
std_features<-grep("-std\\(\\)", features[, 2])
mean_std_features<-c(mean_features,std_features)

extract_data <- data[,mean_std_features]


#3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")
activity_labels[, 2] = gsub("_", "", activity_labels[, 2])
activity[, 1] = activity_labels[activity[,1],2]


#4. Appropriately labels the data set with descriptive variable names. 

name_measurements<- gsub("\\(|\\)","",features [mean_std_features,2])
names(extract_data) <- name_measurements
names(activity) <- "ActivityDescription"
names(subject) <- "Subject"

#4.1 Combine Subject, activity and measurements and write to a file

tidy_data_set <- cbind (subject,activity,extract_data)
write.table(tidy_data_set,"tidy_data_set_step_4_file.txt")


#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

sumvars <- c("Subject","ActivityDescription")
average_data_set <- ddply(tidy_data_set,sumvars,numcolwise(mean,na.rm = TRUE))
write.table(average_data_set,"average_data_set_step_5_file.txt",row.name=FALSE)


