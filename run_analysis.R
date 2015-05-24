# 1. Merges the training and the test sets to create one data set.

subject_train <- read.table("./data/subject_train.txt")
X_train <- read.table("./data/X_train.txt")
y_train <- read.table("./data/y_train.txt")
train <- cbind(X_train, y_train, subject_train)

subject_test <- read.table("./data/subject_test.txt")
X_test <- read.table("./data/X_test.txt")
y_test <- read.table("./data/y_test.txt")
test <- cbind(X_test, y_test, subject_test)

data <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./data/features.txt")
mean <- grep("mean()", features$V2, fixed = TRUE)
std <- grep("std()", features$V2)
index <- c(mean, std)
index <- sort(index)
d <- data[, c(index, 562, 563)]

# 3. Uses descriptive activity names to name the activities in the data set

d$V1.1 <- as.factor(d$V1.1)
levels(d$V1.1) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

# 4. Appropriately labels the data set with descriptive variable names. 

f <- features$V2
f <- as.vector(f)
f <- f[index]
names(d) <- c(f, "Activity", "Subject")

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

library(reshape2)
molten <- melt(d, id = c("Activity", "Subject"))
summary <- dcast(molten, Activity + Subject ~ variable, mean)
write.table(summary, "./data/tidydata.txt", row.name = FALSE)