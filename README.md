# CourseProject
Getting and Cleaning Data Course Project

There are three files for this project, the "README.md", "run_analysis.R", and "CodeBook.md."

I follow the steps below to create my tidy data set.

1. Merges the training and the test sets to create one data set.
    The "subject_train.txt", "X_train.txt", y_train.txt", "subject_test.txt", "subject_test.txt", and 
    "subject_test.txt" are all placed in the data folder in the working directory. Train data sets and test data 
    sets are each merged using cbind. Then they are merged using rbind to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    Only measurements with mean and std are kept.

3. Uses descriptive activity names to name the activities in the data set
    1  = WALKING
    2  = WALKING_UPSTAIRS
    3  = WALKING_DOWNSTAIRS
    4  = SITTING
    5  = STANDING
    6  = LAYING

4. Appropriately labels the data set with descriptive variable names. 
    Please see CodeBook.md for description variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
each activity and each subject.

The goal is to prepare tidy data that can be used for later analysis.