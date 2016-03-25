# Download and unzip the dataset:
if (!file.exists("data.zip")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "data.zip", method="curl")
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip("data.zip") 
}

# Load the column names
cols <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors = FALSE)
cols <- cols$V2

# load the activity names
activities <- read.table('UCI HAR Dataset/activity_labels.txt', stringsAsFactors = FALSE)$V2

# load the train data
train <- read.table('UCI HAR Dataset/train/X_train.txt', col.names=cols)
rows_train <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
colnames(subject_train) <- "Subject"

# add subject and activity data to the train data
trainc <- cbind(rows_train, train)
trainc <- cbind(subject_train, trainc)

# load the test data
test <- read.table('UCI HAR Dataset/test/X_test.txt', col.names=cols)
rows_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
colnames(subject_test) <- "Subject"

# add subject and acitivity to the test data
testc <- cbind(rows_test, test)
testc <- cbind(subject_test, testc)


# union the train and test data
combined <- merge(trainc, testc, all=TRUE, sort=FALSE)


# select only the columns with mean and std and also the first column
# containing activity names.
# the column names are mangled by make.names so that "std()" is replaced
# by "std..
meanstds <- select(combined, matches('(\\.std\\.\\.|\\.mean\\.\\.|V1|Subject)'))

# create a column with activity names, and remove the numbers.
d <- mutate(meanstds, Activity = activities[meanstds$V1])
d <- select(d, -V1)

# calculate the mean for the 5th point in the task
grp <- group_by(d, Activity, Subject)
v5 <- summarise_each(grp, funs(mean))

# fix the column names just a bit
tmp <- colnames(v5)
tmp <- gsub("^t", "Time ", tmp)
tmp <- gsub("^f", "Frequency ", tmp)
tmp <- gsub("\\.std\\.\\.", " std() ", tmp)
tmp <- gsub("\\.mean\\.\\.", " mean() ", tmp)
tmp <- gsub("\\.X$", "X", tmp)
tmp <- gsub("\\.Y$", "Y", tmp)
tmp <- gsub("\\.Z$", "Z", tmp)

colnames(v5) <- tmp
write.table(v5, "result.txt", row.name=FALSE)