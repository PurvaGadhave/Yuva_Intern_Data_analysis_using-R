
# WEEK 2 TASK: DATA VISUALIZATION AND INSIGHT COMMUNICATION USING R

# Install packages once if required:
# install.packages(c("ggplot2", "dplyr", "tidyr"))

library(ggplot2)
library(dplyr)
library(tidyr)

# 1. Load Dataset

data <- read.csv("titanic.csv", stringsAsFactors = FALSE)

# Basic inspection
head(data)
str(data)
summary(data)

# 2. Prepare Variables for Visualization

data$Survived_Label <- factor(
  data$Survived,
  levels = c(0, 1),
  labels = c("Did not survive", "Survived")
)

data$Pclass <- factor(
  data$Pclass,
  levels = c(1, 2, 3),
  labels = c("1st Class", "2nd Class", "3rd Class")
)

data$Sex <- factor(data$Sex)

# 3. Bar Chart: Survival by Gender

p1 <- ggplot(data, aes(x = Sex, fill = Survived_Label)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Survival by Gender",
    x = "Gender",
    y = "Number of Passengers",
    fill = "Outcome"
  ) +
  theme_minimal()

print(p1)

ggsave(
  "outputs/01_survival_by_gender.png",
  plot = p1, width = 8, height = 5, dpi = 300
)

# 4. Bar Chart: Survival by Passenger Class

p2 <- ggplot(data, aes(x = Pclass, fill = Survived_Label)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Survival by Passenger Class",
    x = "Passenger Class",
    y = "Number of Passengers",
    fill = "Outcome"
  ) +
  theme_minimal()

print(p2)

ggsave(
  "outputs/02_survival_by_class.png",
  plot = p2, width = 8, height = 5, dpi = 300
)

# 5. Histogram: Age Distribution

p3 <- ggplot(data, aes(x = Age)) +
  geom_histogram(
    bins = 30,
    na.rm = TRUE,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Age Distribution of Passengers",
x = "Age",
    y = "Number of Passengers"
  ) +
  theme_minimal()

print(p3)

ggsave(
  "outputs/03_age_distribution.png",
  plot = p3, width = 8, height = 5, dpi = 300
)

# 6. Box Plot: Fare by Passenger Class

p4 <- ggplot(data, aes(x = Pclass, y = Fare)) +
  geom_boxplot(na.rm = TRUE) +
  labs(
    title = "Fare Distribution by Passenger Class",
    x = "Passenger Class",
    y = "Fare"
  ) +
  theme_minimal()

print(p4)

ggsave(
  "outputs/04_fare_by_class_boxplot.png",
  plot = p4, width = 8, height = 5, dpi = 300
)

# 7. Scatter Plot: Age vs Fare

p5 <- ggplot(data, aes(x = Age, y = Fare, color = Sex)) +
  geom_point(alpha = 0.6, na.rm = TRUE) +
  labs(
    title = "Relationship Between Age and Fare",
    x = "Age",
    y = "Fare",
    color = "Gender"
  ) +
  theme_minimal()

print(p5)

ggsave(
  "outputs/05_age_vs_fare_scatter.png",
  plot = p5, width = 8, height = 5, dpi = 300
)

# 8. Line Chart: Average Fare by Passenger Class

fare_summary <- data %>%
  group_by(Pclass) %>%
  summarise(
    Average_Fare = mean(Fare, na.rm = TRUE),
    .groups = "drop"
  )

p6 <- ggplot(fare_summary, aes(x = Pclass, y = Average_Fare, group = 1)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  labs(
    title = "Average Fare by Passenger Class",
    x = "Passenger Class",
    y = "Average Fare"
  ) +
  theme_minimal()

print(p6)

ggsave(
  "outputs/06_average_fare_by_class.png",
  plot = p6, width = 8, height = 5, dpi = 300
)

# 9. Additional Visualization: Survival Rate by Class

survival_rate <- data %>%
  group_by(Pclass) %>%
  summarise(
    Survival_Rate = mean(Survived, na.rm = TRUE) * 100,
    .groups = "drop"
  )

p7 <- ggplot(survival_rate, aes(x = Pclass, y = Survival_Rate)) +
  geom_col() +
  labs(
    title = "Survival Rate by Passenger Class",
    x = "Passenger Class",
    y = "Survival Rate (%)"
  ) +
  theme_minimal()

print(p7)

ggsave(
  "outputs/07_survival_rate_by_class.png",
  plot = p7, width = 8, height = 5, dpi = 300
)

# 10. Save Key Numerical Summaries

write.csv(
  fare_summary,
  "outputs/average_fare_by_class.csv",
  row.names = FALSE
)

write.csv(
  survival_rate,
  "outputs/survival_rate_by_class.csv",
  row.names = FALSE
)

# End of Week 2 analysis
