# Reading three files of data from train data:
train.set <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, 
                      sep = "")
train.labels <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt",
                             header = FALSE)

# Reading three files of data from test data:
test.set <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE,
                       sep = "")
test.labels <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                            header = FALSE)

