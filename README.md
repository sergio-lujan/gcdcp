# Getting and Cleaning Data - Course Project

## Overview

This repository contains a solution for the *Getting and Cleaning Data* course project.  
The goal of this project is to demonstrate the ability to collect, merge, transform, and summarize raw sensor data into a tidy dataset.

The original dataset comes from the **UCI Human Activity Recognition Using Smartphones Dataset**.

---

## Objective

The script `run_analysis.R` performs the following tasks:

1. Merges the training and test datasets into one dataset.
2. Extracts only measurements on the mean and standard deviation.
3. Uses descriptive activity names instead of activity IDs.
4. Labels the dataset with descriptive variable names.
5. Creates a second independent tidy dataset with the average of each variable for each activity and each subject.

---

## Files in this repository

- `run_analysis.R`  
  Main R script that performs all data processing steps.

- `tidy_data.txt`  
  Final output dataset containing the average of each variable for each activity and subject.

---

## Dataset description

The input dataset includes measurements from smartphone accelerometers collected from 30 subjects performing six activities:

- Walking  
- Walking upstairs  
- Walking downstairs  
- Sitting  
- Standing  
- Laying  

Each observation includes multiple sensor signals processed into feature vectors.

---

## Requirements

The script requires the following R package:

- `dplyr`

Install it if necessary:

```r
install.packages("dplyr")
