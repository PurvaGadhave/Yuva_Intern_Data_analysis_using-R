
# Week 1 Task: Data Cleaning and Preliminary Analysis with R
# Dataset: Titanic Dataset

# 1. Load Dataset

data <- read.csv("titanic.csv")

# 2. Initial Data Inspection

# Display first 6 rows
head(data)

# Display last 6 rows
tail(data)

# Display structure of dataset
str(data)

# Display summary statistics
summary(data)

# Display dimensions
dim(data)

# Display column names
names(data)

# 3. Check Missing Values

colSums(is.na(data))

# 4. Check Duplicate Records

sum(duplicated(data))

# 5. Basic Information  

nrow(data)
ncol(data)
