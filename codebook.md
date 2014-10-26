The raw data: the test and train datasets were updated by adding two additional columns: subject_id (from the subject_xxx.txt file) and activity_id (from the y_xxx.txt file). 
The two updated datasets were merged by attaching the rows of the train dataset as new rows to the test dataset.
The resulting dataset's header contained generic column names(V1...V563). The names of columns V1..V561 were updated with the feature names from the features.txt file.
The last two column names (V562 and V563) were updated to "subject_id" and "activity_id", respectively.
The dataset was further refined by eliminating all columns that did not represent estimates of the mean or standard deviation of specific parameters. This was done by identifying and keeping all variables that included the terms "mean()" or "std()" in their names. The variables representing weighted average of the frequency components, i.e mean frequencies, as well as the vectors obtained by averaging the signals in a signal window sample (included in the "angle()" variable) were excluded as not being in the assumed scope of the analysis.
For a full description of the raw variables please see the feature_info.txt file.  

Codebook:
The resultant dataset variables  were re-named to be more human-intelligible in the following manner:
t at the beginning of variables names became "time"
Acc became "acceleration"
Gyro became "gyroscope"
Mag became "magnification"
std became "standard deviation"
X,Y,Z became x (or y or z) axis, respectively.
Further, the activity_id column , that contained activity codes, was replaced with a column containing corresponding activity names.


Using this dataset, averages for each type was measurement by subject and activity were calculated. The output of this calculation was a tidy dataset with 180 rows (30 subjects x 6 activities) and 68 variables, 66 of which were the calculated averages of the measurements.  The variables of the tidy dataset were:

subject_id: idnumber (unique)(1-30)
activity_name: factor (levels "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS")
the rest of the variables are means of the those respective measurements (number)(-1,1)
