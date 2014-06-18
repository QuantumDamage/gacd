Script called "run_analysis.R" is preparing two data frames.

First data frame called *full.dataset* contains all data merged from test files and train files. Apart from standard 561 variables it contains column *origin* which describes origin of data (test/train), *subject* which contains subject number and *activity.labels* which contains labels for activities.

Second data frame *second.dataset* contains mean values for all variables for subjects in particular activities. We have 6 activities and 30 subjects which gives 180 combination of subjects in activities. Means are calculated for every 561 variables.

Every task for this project is marked with commentary in source code.

CodeBook is copied from data source files.