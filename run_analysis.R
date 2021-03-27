#combining train and test data

X_train <- read.table('/home/smith/UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('/home/smith/UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('/home/smith/UCI HAR Dataset/test/y_test.txt')
X_test <- read.table('/home/smith/UCI HAR Dataset/test/X_test.txt')
sub_test <- read.table('/home/smith/UCI HAR Dataset/test/subject_test.txt', col.names = c('subject_id'))
sub_train <- read.table('/home/smith/UCI HAR Dataset/train/subject_train.txt', col.names = c('subject_id'))
act_label <- read.table('/home/smith/UCI HAR Dataset/activity_labels.txt', col.names = c('activity_label','activity_name'))
features <- read.table('/home/smith/UCI HAR Dataset/features.txt', col.names = c('feature_name, feature_label'))
colnames(X_train) <- features$feature_name
colnames(X_test) <- features$feature_name
colnames(y_train) <- c('activity_label')
colnames(y_test) <- c('activity_label')
train_data <- cbind(sub_train,X_train,y_train)
test_data <- cbind(sub_test,X_test,y_test)
data <- rbind(train_data, test_data)

#Extracting mean and standard deviation for each measurement
mean_std_col <- grep(pattern = 'mean\\(\\)|std\\(\\)',names(data))
mstd_data<- data[,c(1,mean_std_col,563)]

#changing activity numbers to  names
mstd_data$activity <- factor(data$activity_label, levels = act_label$activity_label , labels = act_label$activity_name)
mstd_data <- mstd_data[,c(-68)]

#appropriately naming variables in the data set
colnames(mstd_data) <- gsub(pattern = '\\(\\)', replacement = '',x = names(mstd_data))
write.table(mstd_data, file = 'tidyData.txt', row.names = F, quote = F, sep = "\t")

#new tidy dataset with average for each variable for each subject and activity
average_sub_act <- group_by(mstd_data, subject_id, activity_label) %>% summarise_all(list(mean))
write.table(average_sub_act, file = 'tidyMeanData.txt', row.names = F, quote = F, sep = "\t")

        
        