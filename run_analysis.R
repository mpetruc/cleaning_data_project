#Step 1.Merges the training and the test sets to create one data set.
#Reads all required data files first
test=read.table("./test/X_test.txt", header=F)
subjects_test=read.table("./test/subject_test.txt")
activity_test=read.table("./test/y_test.txt")
train=read.table("./train/X_train.txt", header=F)
subjects_train=read.table("./train/subject_train.txt")
activity_train=read.table("./train/y_train.txt")
#creates a working copy of the test and the training datasets
test_wip=test
train_wip=train
#attaches the subject_id and activity_id to the test and train datasets as 
#two additional columns
train_wip=cbind(train_wip,subjects_train)
train_wip=cbind(train_wip,activity_train)
test_wip=cbind(test_wip,subjects_test)
test_wip=cbind(test_wip,activity_test)
#merges the test and the train dataset in one full dataset
dataset_raw=rbind(test_wip,train_wip)
#creates the header for the full dataset based on the feature names from
#the features.txt file and adding column names for subject and activity id
names=read.table("features.txt", stringsAsFactors=F,header=F)
names=names[,2]
names1=c(names,"subject_id","activity_id")
colnames(dataset_raw)=names1


#Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#identifies the column names that represent meand and standard deviation 
#it is assumed and only column names that include "()" qualify for inclusion
mean_col=grep("mean\\(\\)",colnames(dataset_raw))
std_col=grep("std\\(\\)",colnames(dataset_raw))
mean_std_cols=c(mean_col,std_col)
final_cols=c(mean_std_cols,562,563)
dataset=dataset_raw[,final_cols]

#Step3: Uses descriptive activity names to name the activities in the data set
activity_lables=read.table("activity_labels.txt", header=F, stringsAsFactors=F)
names(activity_lables)=c("activity_id","activity_name")
dataset_f=merge(dataset,activity_lables, by="activity_id")
#the first column is the activity_id that is no longer needed, so we exclude it
dataset_f=dataset_f[,2:69]

#Step4: Appropriately labels the data set with descriptive variable names.
#replaces the abbreviations in the orginal column names with human understandable words
names_f=names(dataset_f)
names_f=gsub("BodyBody","Body",names_f, perl=T)
names_f=gsub("tGravityAcc","time_gravity_acceleration",names_f, perl=T)
names_f=gsub("tBodyGyro","time_body_gyroscope",names_f, perl=T)
names_f=gsub("tBodyAcc","time_body_acceleration",names_f, perl=T)
names_f=gsub("fBodyAcc","frequency_body_acceleration",names_f, perl=T)
names_f=gsub("fBodyGyro","frequency_body_gyroscope",names_f, perl=T)
names_f=gsub("Jerk","_jerk",names_f, perl=T)
names_f=gsub("Mag","_magnification",names_f, perl=T)
names_f=gsub("\\-mean\\(\\)","_mean",names_f, perl=T)
names_f=gsub("\\-std\\(\\)","_standard_deviation",names_f, perl=T)
names_f=gsub("\\-X","_x_axis",names_f, perl=T)
names_f=gsub("\\-Y","_y_axis",names_f, perl=T)
names_f=gsub("\\-Z","_z_axis",names_f, perl=T)
names(dataset_f)=names_f

#step5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
names=names(dataset_f)[1:66]
datasetf_melt=melt(dataset_f,id=c("subject_id","activity_name"),measures.vars=names)
datasetf_cast=dcast(datasetf_melt,subject_id+activity_name~names,mean)
write.table(datasetf_cast,file="tidyset.txt",row.name=FALSE)




