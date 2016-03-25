Code Book
=============


## Source

The source data is described in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Study design

We merged the test and trial data, and then calculated the mean of the observations for each category, to summarize that in the resulting table stored in `result.txt`.

## Code Book

- The variables with `X/Y/Z` come in three different variants, each in the respective axis.
- `Frequency` denotes frequency domain data.
- `Time` denotes time domain data
- `mean()` is for mean values
- `std()` is standard deviations
- Data is collected from the accelerometer (`Acc`) and the gyroscope (`Gyro`)
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.
- see 'features_info.txt' in the data set for a more complete description of all the variables in the data set.

### Variables below


`Activity` The name of the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

`Subject` The test subject number

`Time BodyAcc mean()/std()  X/Y/Z`

`Time GravityAcc mean()/std() X/Y/Z`

`Time BodyAccJerk mean()/std() X/Y/Z`

`Time BodyGyro mean()/std() X/Y/Z`

`Time BodyGyroJerk mean()/std() X/Y/Z`

`Time BodyAccMag mean()/std()`

`Time GravityAccMag mean()/std()`

`Time BodyAccJerkMag mean()/std()`

`Time BodyGyroMag mean()/std()`

`Time BodyGyroJerkMag mean()/std()`


`Frequency BodyAcc mean()/std() X/Y/Z`

`Frequency BodyAccMag mean()/std()`

`Frequency BodyBodyAccJerkMag mean()/std()`

`Frequency BodyBodyGyroMag mean()/std()`

`Frequency BodyBodyGyroJerkMag mean()/std()`

