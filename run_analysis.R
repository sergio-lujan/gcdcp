# ---------------------------------------------
# Getting and Cleaning Data - Peer Review Script
# ---------------------------------------------

# 1. Load required packages (optional but recommended)
library(dplyr)

# 2. Set working directory (adjust as needed)
# setwd("UCI HAR Dataset")

# 3. Read feature and activity labels
features <- read.table("features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("activity_labels.txt",
                              col.names = c("activityId", "activity"))

# 4. Read training data
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt", col.names = "activityId")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")

# 5. Read test data
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt", col.names = "activityId")
subject_test <- read.table("test/subject_test.txt", col.names = "subject")

# 6. Merge training and test sets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# 7. Assign column names to dataset
colnames(X) <- features$feature

# 8. Extract mean and standard deviation measurements
mean_std_cols <- grepl("mean\\(\\)|std\\(\\)", features$feature)

X_subset <- X[, mean_std_cols]

# 9. Use descriptive activity names
y$activityId <- factor(y$activityId, 
                       levels = activity_labels$activityId,
                       labels = activity_labels$activity)

# 10. Create one clean dataset
clean_data <- cbind(subject, y, X_subset)

# 11. Appropriately label dataset with descriptive variable names
names(clean_data) <- gsub("^t", "time", names(clean_data))
names(clean_data) <- gsub("^f", "frequency", names(clean_data))
names(clean_data) <- gsub("Acc", "Accelerometer", names(clean_data))
names(clean_data) <- gsub("Gyro", "Gyroscope", names(clean_data))
names(clean_data) <- gsub("Mag", "Magnitude", names(clean_data))
names(clean_data) <- gsub("BodyBody", "Body", names(clean_data))
names(clean_data) <- gsub("[()\\-]", "", names(clean_data))

# 12. Write output file with clean data
write.table(clean_data, "tidy_clean_data.txt", row.names = FALSE)

# 13. Create second tidy dataset with averages
tidy_data <- clean_data %>%
  group_by(subject, activityId) %>%
  summarise(across(everything(), mean))

# 14. Write output file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# ---------------------------------------------
# End of script
# ---------------------------------------------
