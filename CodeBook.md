## Code Book File
The script run_analysis.R performs the 5 steps described in the course project's definition.

Firstly, all similar datas in the test and traing directories merged by using rbind() function.

After merge process the columns with the mean and std dev. measures are filtered from all dataset. After this the column names updated by using features.txt file.

Then activity names updated with their correct names by using activity_labels.txt data set .

Then all datas binded in a single data set by using cbind() function.

And finally generated new tidy data set with the average of each variable for each activity and each subject by using ddply() function. The output file is called tidy_data_avegare.txt as uploaded to this repository.

##Variable Explanations

X_train, y_train, X_test, y_test, subject_train and subject_test is defined to store the data from the downloaded files.
X_data, y_data and subject_data is defined to store merged datasets defined in 1. step.
features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_std_feat, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
bind_data merges x_data, y_data and subject_data in a big dataset.
Finally, tidy_data_avegare contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
