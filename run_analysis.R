##############################
## Phase 1: Loading

# Function to load a file directly from ZIP file.
loader <- function(filename, ...) {
    read.table(
        unz("Dataset.zip", paste0("UCI HAR Dataset/", filename)),
        header=F, ...)
}

# Load the labels for activities and features from input data set
activity_labels <- loader("activity_labels.txt")[,2]
feature_labels <- sub('()', '', loader("features.txt")[,2], fixed=T)

# Function to load one set of measures (train or test)
read_data_set <- function(subsetname, ...) {
    cbind(
        loader(
            sprintf("%s/y_%s.txt", subsetname, subsetname),
            col.names='activity', ...),
        loader(
            sprintf("%s/subject_%s.txt", subsetname, subsetname),
            col.names='subject', ...),
        loader(
            sprintf("%s/X_%s.txt", subsetname, subsetname),
            col.names=feature_labels, ...))
}

##############################
## Phase 2: Processing

# 1. Merge the data from test and training sets.
data <- rbind(read_data_set('test'), read_data_set('train'))

# 2. Select only the subject, activity, means and standard deviations.
data <- data[,c(1:2, grep("\\b(?:mean|std)\\b", names(data), perl=T))]

# 3. Use the descriptive label for the activities
data$activity <- activity_labels[data$activity]

# 4. Appropriately label the data set with descriptive variable names.
# This was done when loading the data from the input files.

# 5. Creates a tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidy <- ddply(data, .(activity, subject), function(g) colMeans(g[-(1:2)]))

##############################
## Phase 3: Saving

# Save the tidy data set as a txt file created with write.table() using row.name=FALSE
write.table(tidy, "tidy.txt", row.names=F)
