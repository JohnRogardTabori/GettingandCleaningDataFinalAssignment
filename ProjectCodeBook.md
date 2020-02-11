Title:		Project Code Book
Author/Editor:	John Rogard Tabori
Date:		February 9, 2020
Comment:	The original variable discussion by Reyes-Ortiz, et. al. can be found in the 'features_info.txt'.
============================

Below Find the Original Variable Discussion (edited to conform to across the board lower case variable naming convention and changes to the variable names)
================================
START ORIGINAL VARIABLE DISCUSSION
================================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tacceleration-XYZ and tgyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacceleration-XYZ and tgravityacceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals (tbodyaccelerationJerk-XYZ and tbodygyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccelerationMag, tgravityaccelerationmag, tbodyaccelerationjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacceleration-XYZ, fbodyaccelerationjerk-XYZ, fbodygyro-XYZ, fbodyaccelerationjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions in 3 dimensional space.

Time(t) Measured Variables
------------------------------------
tbodyacceleration-XYZ
tgravityacceleration-XYZ
tbodyaccelerationjerk-XYZ
tBodygyro-XYZ
tBodygyrojerk-XYZ
tbodyaccelerationmag
tgravityaccelerationmag
tbodyaccelerationjerkmag
tBodygyromag
tBodygyrojerkmag

Frequency domain signals (f) measured using using a Fast Fourier Transformation (FFT) method:
--------------------------------------------------------------------------------------------------------------------------------
fbodyacceleration-XYZ
fbodyaccelerationjerk-XYZ
fBodygyro-XYZ
fbodyaccelerationmag
fbodyaccelerationjerkmag
fBodygyromag
fBodygyrojerkmag

The set of variables that were estimated from the raw, measured signals were: 
-------------------------------------------------------------------------------------------------------
mean: Mean value
standard_deviation: Standard deviation
mad: Median absolute deviation 
max: Largest value in array
min: Smallest value in array
sma: Signal magnitude area
energy: Energy measure. Sum of the squares divided by the number of values. 
interquartile_range: Interquartile range 
entropy: Signal entropy
autoregression_coeff: Autorregresion coefficients with Burg order equal to 4
correlation: correlation coefficient between two signals
maxInds: index of the frequency component with largest magnitude
meanfreq: Weighted average of the frequency components to obtain a mean frequency
skewness: skewness of the frequency domain signal 
kurtosis: kurtosis of the frequency domain signal 
energybands: Energy of a frequency interval within the 64 bins of the FFT of each window.
angle: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
--------------------------------------------------------------------------------------------------------------------------------------------------------------
gravitymean
tbodyaccelerationmean
tbodyaccelerationjerkmean
tbodygyromean
tbodygyrojerkmean
=======================
END EDITED ORIGINAL TEXT
=======================
When fully combined the above variables resulted in 561 variables that were measured or calculated per case/row.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Four additional variables were added to the three "tidy" datafiles that were output by the R source code described in README.md:

1.	alphaactivitycode:  These are plain language descriptors of the activities that were measured - (1) WALKING. (2) WALKING_UPSTAIRS, (3) WALKING_DOWNSTAIRS, (4) SITTING, (5) STANDING, 
			and (6) LAYING.
2.	activitycode:	This variable represents the numeric value of each activity described above.  The numeric code was retained as a quality control measure. It is redundant and can be removed.
3.	subject:		This variable represents the individual subbject whose activities were measured. The codes are numeric and range from 1 through 30 representing the 30 subjects.
4.	testortrain	This variable indicates whether the subject belonged to one of two groups, those who underwent training (TRAIN) before testing and those who just underwent testing (TEST).
			These appear to be the equivalent of an experimental and a control group.  The grouping is, of course, binary (TRAIN or 	TEST).

The complete list of variables of each feature vector as modified by the author of this document are in the following files produced by the 'run_analysis.R' script:

1.	MF1vars.txt
2.	MF2vars.txt
3.	MF2MeltMeanVars.txt
