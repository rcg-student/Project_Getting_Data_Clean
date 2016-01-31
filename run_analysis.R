library(plyr)
 
 # Merge the training and test sets to create one data set
 # Appropriately label the data set with descriptive variable names
 
LABELS <- read.table("extra/features.txt")
ACTIVITIES <- read.table("extra/activity_labels.txt")

TEST <- read.table("test/X_test.txt")
SUBJECT_TEST <- read.table("test/subject_test.txt")
COD_ACTIVITY_TEST <- read.table("test/Y_test.txt")
colnames(TEST) <- as.character(LABELS$V2)
for (i in 1:length(SUBJECT_TEST$V1)) {
TEST$subject[i] <- paste("Test_subject_",SUBJECT_TEST$V1[i],sep="")
if (COD_ACTIVITY_TEST$V1[i] == 1) {TEST$activity[i] = as.character(ACTIVITIES$V2[1])}
if (COD_ACTIVITY_TEST$V1[i] == 2) {TEST$activity[i] = as.character(ACTIVITIES$V2[2])}
if (COD_ACTIVITY_TEST$V1[i] == 3) {TEST$activity[i] = as.character(ACTIVITIES$V2[3])}
if (COD_ACTIVITY_TEST$V1[i] == 4) {TEST$activity[i] = as.character(ACTIVITIES$V2[4])}
if (COD_ACTIVITY_TEST$V1[i] == 5) {TEST$activity[i] = as.character(ACTIVITIES$V2[5])}
if (COD_ACTIVITY_TEST$V1[i] == 6) {TEST$activity[i] = as.character(ACTIVITIES$V2[6])}
}  

TRAIN <- read.table("train/X_train.txt")
SUBJECT_TRAIN <- read.table("train/subject_train.txt")
COD_ACTIVITY_TRAIN <- read.table("train/Y_train.txt")
colnames(TRAIN) <- as.character(LABELS$V2)
for (i in 1:length(SUBJECT_TRAIN$V1)) {
  TRAIN$subject[i] <- paste("Train_subject_",SUBJECT_TRAIN$V1[i],sep="")
  if (COD_ACTIVITY_TRAIN$V1[i] == 1) {TRAIN$activity[i] = as.character(ACTIVITIES$V2[1])}
  if (COD_ACTIVITY_TRAIN$V1[i] == 2) {TRAIN$activity[i] = as.character(ACTIVITIES$V2[2])}
  if (COD_ACTIVITY_TRAIN$V1[i] == 3) {TRAIN$activity[i] = as.character(ACTIVITIES$V2[3])}
  if (COD_ACTIVITY_TRAIN$V1[i] == 4) {TRAIN$activity[i] = as.character(ACTIVITIES$V2[4])}
  if (COD_ACTIVITY_TRAIN$V1[i] == 5) {TRAIN$activity[i] = as.character(ACTIVITIES$V2[5])}
  if (COD_ACTIVITY_TRAIN$V1[i] == 6) {TRAIN$activity[i] = as.character(ACTIVITIES$V2[6])}
}  

TEST_AND_TRAIN <- rbind(TEST, TRAIN)

# Extract only the measurements on the mean and standard deviation for each measurement
# get only columns with mean() or std() in their names

TEST_AND_TRAIN_SELECTED <- grep('subject', names(TEST_AND_TRAIN))
for (string in c('activity','mean','std')){
  TEST_AND_TRAIN_SELECTED <- c(TEST_AND_TRAIN_SELECTED,grep(string, names(TEST_AND_TRAIN)))
}

TEST_AND_TRAIN <- TEST_AND_TRAIN[TEST_AND_TRAIN_SELECTED]

# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

AVG_TEST_AND_TRAIN <- ddply(TEST_AND_TRAIN, .(subject, activity), function(x) colMeans(x[, 3:81]))
write.table(AVG_TEST_AND_TRAIN, "AVG_TEST_AND_TRAIN.txt", row.name=FALSE)
