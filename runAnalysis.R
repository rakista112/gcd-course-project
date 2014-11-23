runAnalysis <- function(dirName){
  features <- read.table(paste(dirName, 'features.txt', sep=''))
  features <- features[,2]
  
  activityLabels <- read.table(paste(dirName, 'activity_labels.txt', sep=''), col.names=c('activity_id', 'activity'))
  
  subject_train <- read.table(paste(dirName, 'train/subject_train.txt', sep=''))
  subject_test <- read.table(paste(dirName, 'test/subject_test.txt', sep=''))
  
  activity_train <- read.table(paste(dirName, 'train/y_train.txt', sep=''))
  activity_test <- read.table(paste(dirName, 'test/y_test.txt',sep=''))
  
  X_test <- read.table(paste(dirName, 'test/X_test.txt', sep=''), header=F, colClasses='numeric')
  X_train <- read.table(paste(dirName, 'train/X_train.txt', sep=''), header=F, colClasses='numeric')
  
  colnames(X_test) <- features
  colnames(X_train) <- features
  
  X_train$subject <- as.numeric(subject_train[,1])
  X_test$subject <- as.numeric(subject_test[,1])  
  
  X_train$activity_id <- as.numeric(activity_train[,1])
  X_test$activity_id <- as.numeric(activity_test[,1])
  
  X_all <- rbind(X_test, X_train)
  
  X_all <- merge(X_all, activityLabels, by.x='activity_id', by.y='activity_id')
  
  X_all
}