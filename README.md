==================================================================
A Tidy Human Activity Recognition Dataset Using Smartphones
Version 2.0
==================================================================
Author:  John Rogard Tabori
Completed:  February 9, 2020
Based on the Dataset Provided by:
	Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
	Smartlab - Non Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova.
	Via Opera Pia 11A, I-16145, Genoa, Italy.
	activityrecognition@smartlab.ws
	www.smartlab.ws
	ALL original text by Reyes-Ortiz, et. al. are inclosed in quotes ("<text>"),
	and come from the accompanying README.txt file.
Original Download of Reyes-Ortiz dataset on 1/11/2020
==================================================================
I.  Overview of the Experiment:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

"The sensor signals (accelerometer and gyroscope) were per-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

II. Overview of Data Recorded in each Record:

For each record the following data are provided:
======================================

"- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables.  See Code_Book.txt for a full description of the variables
- Its activity label. 
- An identifier of the subject who carried out the experiment."

III.  Data Sets Used and Produced:

The final data files and datasets that were uploaded to my GITHUB repository, include the following files (Files created by the author are README.txt and below):
=========================================
IIIa. The Original Files from the Reyes-Ortiz, et. al. study website:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

IIIb. Files created by the author to meet the requirements of the assignment:

- 'README.md':  By the author/You are reading it (lol).

- 'ProjectCodeBook.txt':  Describes all the variables as included in the files produced by the r-source code (run_analysis.R)

- 'features__var_names10.csv": This is a fully modified, variable names file created using    EXCEL to edit the variable names.

- 'run_analysis.R':  r-source code that produces the final Tidy data files as listed below:

	** 'MF1out.csv':  This is the fully integrated file with all original variables plus one additional variable "trainortest" (See the ProjectCodeBook)

	** 'MF2out.csv':  This is a modified file that only contains MEAN and STANDARD DEVIATION (std) variables.

	** 'MeanByActivityAndSubjectOut.txt':  This is the required file to be assessed through Peer Review.  It is more fully described below under Notes  1 and
	     in the ProjectCodeBook.

IV. Notes and Comments:

Notes 1 (Author Notes and Comments):
======
1a.  All the output files were created using the program 'run_analysis.R', two of which
    are intermediary working files and meet the requirements of Steps 1-4 of the final
    Peer review assignment.  The are named MF1out.csv and MF2out.csv.  Both can be read
    back into an R data.frame for purposes of further analysis.  Both are tidy files in
    that they are organized with each row representing a unique subject and a unique
    activity measured across each variable.
1b. The r-script creates the desired files by (a) reading the relevant study files into
    r-data.frame files, column binding (cbind) them and then row binding the two datasets
    together.
2.  I added a variable to each file named "trainandtest".  In the variable, each subject
    is coded as either a "TRAIN" or "TEST" subject.  My presumption is that each category
    is the equivalent of either an EXPERIMENTAL (TRAIN) or CONTROL (TEST) subject. Such
    a designation appears to be missing from the original datasets.
3.  On completion of tasks 1a, 1b, and 2, two "tidy" analytical files were created, called
    MF1 and MF2.  MF1 contains all the original variables plus the new testortrain
    variable (dim = 10299 by 565).  MF2 contains only the mean and standard deviation
    variables plus the testortrain variable (dim = 10299 by 83).
4.  In accordance with the requirements of the final course assignment, the final file
    is written out as a text file.  As in the case of the other two files, it contains
    data on each subject across each activity using the narrative descriptor of the 
    six activities (alphaactivitycode) that were assessed, the subject code (subject) and     the testortrain variable, with the grand mean calculated across the mean variables
    (dim = 180 by 5) Please note that the standard deviation variables were excluded from     this calculation. Combining the standard deviations into the grand mean would, in my      opinion, confound different measurement types and make it impossible to calculate         Z-Scores, which may be of some interest in this situation.
5.  I do not regard any of the code that I developed as unique either partially or 
    sigularly, or for that matter the datasets produced using the code.  Hence, I do not
    require any licensing for there use, although you should be aware that the original
    authors of the datasets that I used do require licensing under certain circumstances      (See Note 2 below). However, I would appreciate a reference if you appropriate my
    entire code (lol).
    
Notes 2 (Original notes contained in the downloaded README file from Reyes-Ortiz, et.al): 
======
"- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License for Use of the Original Datasets:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012."
