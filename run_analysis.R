#setting working directory
setwd("D:/Data Scientist/Data Cleaning")

#Step 1 Merges the training and the test sets to create one data set
# read the train data
X_train <- read.table("train/X_train.txt") #read x train table data
y_train <- read.table("train/y_train.txt") #read y train table data
subject_train <- read.table("train/subject_train.txt") #read subject train table data

# read test data
X_test <- read.table("test/X_test.txt") #read x test table data
y_test <- read.table("test/y_test.txt") #read y test table data
subject_test <- read.table("test/subject_test.txt") #read subject test table data

# merge x data set
X_data <- rbind(X_train,X_test)
# merge y data set
y_data <- rbind(y_train,y_test)
# merge subject data set
subject_data <- rbind(subject_train,subject_test)

#Step 2 Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")

# get only columns with mean or std words in their names by using grep function
mean_std_feat <- grep("mean\\(\\)|std\\(\\)", features[, 2])

# get the subset of X data according to mean and std dev. index
X_data <- X_data[, mean_std_feat]

# the column names
names(X_data) <- features[mean_std_feat, 2]

#Step 3 Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")

# update values with activity label names
y_data[, 1] <- activity_labels[y_data[, 1], 2]
names(y_data) <- "activity"


#Step 4 Appropriately labels the data set with descriptive variable names.

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
bind_data <- cbind(X_data, y_data, subject_data)

#Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

colCnt <- dim(bind_data) #68  -2 (activity and subject columns)
tidy_data_avegare <- ddply(bind_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_data_avegare, "tidy_data_avegare.txt", row.name=FALSE)
