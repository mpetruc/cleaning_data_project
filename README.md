cleaning_data_project
=====================
The Human Activity Recognition Using Smartphones Dataset consists of two main files: test and train. In addition,  subject and activity files exist for each of test and train datasets. the list of features is contained in the features.txt files.
The application reads these files, merges them as required, extracts relevant features, performs specific statistical tests and saves a tidy daset that includes the aggregate statistical results. The application funstion as follows:

Step 1.Merges the training and the test sets to create one data set.
  Reads all required data files first
  Creates a working copy of the test and the training datasets
  attaches the subject_id and activity_id to the test and train datasets as two additional columns
  merges the test and the train dataset in one full dataset
  creates the header for the full dataset based on the feature names from the features.txt file and adding column names for subject and activity id
  
Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 
  identifies the column names that represent meand and standard deviation 
  it is assumed and only column names that include "()" in addition to mean and std qualify for inclusion
  
Step3: Uses descriptive activity names to name the activities in the data set
  uses the merge function to link the human readable activity names from "activity_lables" file to the dataset that so far included only an activity code.
  
Step4: Appropriately labels the data set with descriptive variable names.
  replaces the abbreviations in the orginal column names with human understandable words
  For example, "t" is replaced with "time", "Acc" with "Acceleration", etc.

Step5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  The melt() function from the reshape2 library is used first to arange the data so that averages can be calculated
  the dcast() function is used consequently to actualy perform the average calcualtion by subject and activity.
  finally, the script writes the resulting tidy dataset to a file.
  the resultatnt dataset is tidy because each variable is in its own column (no column has merged variables) and each observtion of those variables is in a different row.
  
  
