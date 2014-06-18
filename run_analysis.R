# Reading three files of data from train data:

average.of.variables <- function (df, subject, activity, features) {
  colMeans(df[df$subject == subject & df$activity.labels == activity,features])
}

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

# Reading labels for factors (Task #3a):
label.factors <- read.table("UCI HAR Dataset/activity_labels.txt",
                            header = FALSE, sep = "")

# Adding activity labels (Task #3b): 
train.labels$V1 <- factor(train.labels$V1)
levels(train.labels$V1) <- label.factors$V2

test.labels$V1 <- factor(test.labels$V1)
levels(test.labels$V1) <- label.factors$V2

# Reading names for features (Task #4a):
columns.names <- read.table("UCI HAR Dataset/features.txt", header = FALSE,
                            sep = "")

# Putting columns, names into dataframes (Task #4b):
names(train.set) <- columns.names$V2
names(test.set) <- columns.names$V2

names(train.labels) <- "activity.labels"
names(test.labels) <- "activity.labels"

names(train.subjects) <- "subject"
names(test.subjects) <- "subject"

# Adding origin info:
test.set$origin <- factor("testfile")
train.set$origin <- factor("trainfile")

# Combining subsets:
full.train <- cbind(train.set,train.subjects,train.labels)
full.test <- cbind(test.set,test.subjects,test.labels)

# Combining subsets into one final dataframe (Task #1):
full.dataset <- rbind(full.test,full.train)

# Extracting means and standard deviation (Task #2):
names.with.mean <- names(full.dataset)[grep("mean",names(full.dataset))]
names.with.std <- names(full.dataset)[grep("std",names(full.dataset))]
interesting.names <- c(names.with.mean,names.with.std)
extracted.dataset <- full.dataset[, interesting.names]

# Second dataframe (Task #5):

second.dataset <- expand.grid(unique(full.dataset$activity.labels),
                              unique(full.dataset$subject))
second.dataset[,2+1:length(columns.names$V2)] <- NA
names(second.dataset) <- c("activity", "subject", as.character(columns.names$V2))


for (vat in 1:nrow(second.dataset)) {
  second.dataset[vat, ] <- 
    c(as.character(second.dataset$activity[vat]), second.dataset$subject[vat],
          average.of.variables(full.dataset,second.dataset$subject[vat],
                               second.dataset$activity[vat],columns.names$V2))
}

write.csv(full.dataset, file = "full.dataset.csv")
write.csv(second.dataset, file = "second.dataset.csv")
