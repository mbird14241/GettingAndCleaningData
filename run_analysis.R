# Merges the training and the test sets to create one data set.


train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_act <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_sub, train_act, train)

test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_act <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_sub, test_act, test)

combine <- rbind(train, test)

# Extracts only the measurements on the mean and standard deviation for each measurement.
cols <- readLines("./UCI HAR Dataset/features.txt")
cols <- c("Subject", "Activity", cols)
meanAndStdDev <- combine[,grep("(mean|std)", cols)]

# Uses descriptive activity names to name the activities in the data set
acts <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
act_names <- acts[combine[,2,],2]
combine[,2] <- factor(act_names)

# Appropriately labels the data set with descriptive variable names.
colnames(combine) <- cols

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
combineDT <- as.data.table(combine)
theSummary <- combineDT[, lapply(.SD, mean), by="Subject,Activity"]

write.table(theSummary, file="summaryDataSet.csv", row.names = FALSE)