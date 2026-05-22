# Code Book — Tidy Dataset (Human Activity Recognition)

## 1. Dataset description

This dataset is derived from the UCI Human Activity Recognition Using Smartphones Dataset. It contains the average of selected measurements on mean and standard deviation features extracted from smartphone sensor signals.

Each observation represents the average of variables for a specific subject and activity.

---

## 2. Variables

### 2.1 Identifier variables

- **subject**: Integer identifying the participant (range 1–30)
- **activity**: Factor variable indicating the activity performed

### Activity labels

- WALKING  
- WALKING_UPSTAIRS  
- WALKING_DOWNSTAIRS  
- SITTING  
- STANDING  
- LAYING  

---

### 2.2 Measurement variables

All remaining variables are numeric and represent the **average of original mean and standard deviation features**.

These variables are derived from smartphone accelerometer and gyroscope signals.

They include signals in:

- Time domain (`time`)
- Frequency domain (`frequency`)

---

## 3. Variable naming conventions

The original feature names were cleaned using the following transformations:

- `t` → `time`
- `f` → `frequency`
- `Acc` → `Accelerometer`
- `Gyro` → `Gyroscope`
- `Mag` → `Magnitude`
- `mean()` → `Mean`
- `std()` → `Std`
- `BodyBody` → `Body`
- Removal of special characters: `()`, `-`

---

## 4. Units

All measurements are **normalized and unitless**, as they originate from processed sensor signals.

---

## 5. Data processing steps

The dataset was created by performing the following steps:

1. Merging training and test datasets
2. Extracting only mean and standard deviation features
3. Assigning descriptive activity names
4. Cleaning variable names for clarity
5. Computing the average of each variable grouped by subject and activity

---

## 6. Observational unit

Each row corresponds to:

> The average of all selected measurements for a given subject performing a given activity.

---

## 7. Source

UCI Machine Learning Repository  
Human Activity Recognition Using Smartphones Dataset
