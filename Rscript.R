## LSE Data Analytics Online Career Accelerator 
# DA301:  Advanced Analytics for Organisational Impact

########################################################################################################

# Assignment 5 scenario
## Turtle Games’s sales department has historically preferred to use R when performing 
## sales analyses due to existing workflow systems. As you’re able to perform data analysis 
## in R, you will perform exploratory data analysis and present your findings by utilising 
## basic statistics and plots. You'll explore and prepare the data set to analyse sales per 
## product. The sales department is hoping to use the findings of this exploratory analysis 
## to inform changes and improvements in the team. (Note that you will use basic summary 
## statistics in Module 5 and will continue to go into more detail with descriptive 
## statistics in Module 6.)

########################################################################################################

## Assignment 5 objective
## Load and wrangle the data. Use summary statistics and groupings if required to sense-check
## and gain insights into the data. Make sure to use different visualisations such as scatterplots, 
## histograms, and boxplots to learn more about the data set. Explore the data and comment on the 
## insights gained from your exploratory data analysis. For example, outliers, missing values, 
## and distribution of data. Also make sure to comment on initial patterns and distributions or 
## behaviour that may be of interest to the business.

########################################################################################################

# Module 5 assignment: Load, clean and wrangle data using R

## It is strongly advised that you use the cleaned version of the data set that you created and 
##  saved in the Python section of the course. Should you choose to redo the data cleaning in R, 
##  make sure to apply the same transformations as you will have to potentially compare the results.
##  (Note: Manual steps included dropping and renaming the columns as per the instructions in module 1.
##  Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 

## 1. Open your RStudio and start setting up your R environment. 
## 2. Open a new R script and import the turtle_review.csv data file, which you can download from 
##      Assignment: Predicting future outcomes. (Note: You can use the clean version of the data 
##      you saved as csv in module 1, or, can manually drop and rename the columns as per the instructions 
##      in module 1. Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 
## 3. Import all the required libraries for the analysis and view the data. 
## 4. Load and explore the data.
##    - View the head the data.
##    - Create a summary of the new data frame.
## 5. Perform exploratory data analysis by creating tables and visualisations to better understand 
##      groupings and different perspectives into customer behaviour and specifically how loyalty 
##      points are accumulated. Example questions could include:
##    - Can you comment on distributions, patterns or outliers based on the visual exploration of the data?
##    - Are there any insights based on the basic observations that may require further investigation?
##    - Are there any groupings that may be useful in gaining deeper insights into customer behaviour?
##    - Are there any specific patterns that you want to investigate
## 6. Create
##    - Create scatterplots, histograms, and boxplots to visually explore the loyalty_points data.
##    - Select appropriate visualisations to communicate relevant findings and insights to the business.
## 7. Note your observations and recommendations to the technical and business users.

########################################################################################################

# Your code here.

# 1. Import all the required libraries:
library(dplyr)
library(ggplot2)
library(tidyverse)


# 2. Check and set the working directory:
setwd ("C:/Users/ldwhi/OneDrive/Work/Continuous Professional Development/Data Analytics Career Accelerator/Course 3/Assignment/LSE_DA301_assignment_files_new")


# 3. Import the data without the 'language' or 'platform' columns:
reviews_nec_col <- read.csv("reviews_nec_col.csv", header=T)


# 4. Sense-check the data:

# View the data frame.
View(reviews_nec_col)


# Check the data types.
as_tibble(reviews_nec_col)


# Rename column names with first letter to upper case to improve readability and consistency.
names(reviews_nec_col) <- str_to_title(names(reviews_nec_col))

# View the result.
colnames(reviews_nec_col)
View(reviews_nec_col)

# The first letter of each column name has been changed to upper case.


# Check for missing values.
sum(is.na(reviews_nec_col))

# There are no missing values in the data set.


# Check for duplicated rows
sum(duplicated(reviews_nec_col))

# There are no duplicated rows in the data set.


# Summarise the data (statistics).
summary(reviews_nec_col)


# 5. Perform exploratory data analysis (EDA):

# Q1: Can you comment on the distribution, variability, and outliers of loyalty points, based on the visual 
# exploration of the data?

# Plot the loyalty points variable on a histogram.
ggplot(reviews_nec_col, aes(x = Loyalty_points, y = ..count../sum(..count..))) + 
  geom_histogram(fill = "dark green", color = "black", binwidth = 500) + 
  stat_bin(geom = "text", aes(label = scales::percent(..count../sum(..count..), accuracy = 0.1)), 
           vjust = -0.5, binwidth = 500) + 
  scale_y_continuous(labels = scales::percent) + 
  ylim(0, 0.30) + 
  labs(x = "Number of Loyalty Points",
       y = "Percent of Customers",
       title = "Distribution of Customers by Number of Loyalty Points",
       caption = "Source: Turtle Games") +
  theme_classic()

# Most of the loyalty point values are distributed between 500 and 2,000, representing 66% of customers.
# A further 9% of customers have between 0 and 500 loyalty points each. The remainder (approximately 25% 
# of customers) have between 2,000 and 7,000 loyalty points each. These results are important for Turtle 
# Games, because they indicate that most customers (circa 75%) are not highly engaged with the loyalty 
# points programme. Turtle Games is likely to want more customers to acquire higher numbers of loyalty 
# points, because this would mean that the customers are spending greater amounts of money and/or 
# spending more often.


# Plot the loyalty points variable on a boxplot.

ggplot(reviews_nec_col, aes(y = Loyalty_points)) + 
  geom_boxplot(fill = "dark green") + 
  labs(x = "",
       y = "Number of Loyalty Points",
       title = "Distribution of Loyalty Points",
       caption = "Source: Turtle Games") +
    theme_classic()

# The data in the 'Loyalty_points' column is positively/ right-skewed, meaning the distribution of 
# values is not symmetrical. This skewness is being driven by the more extreme values that are above/ 
# right of the typical range, not by the middle 50% of the data. Some customers are likely to be higher 
# and/or more frequent spenders than others, and therefore, likely to acquire more loyalty points, so 
# the outlier values are likely to be genuine and not data quality issues.


# Q2: Can you comment on the relationships between loyalty points, remuneration, and spending scores, 
# based on the visual exploration of the data?

# Plot the loyalty points variable against the remuneration variable (scatterplot).
ggplot(reviews_nec_col, 
       mapping=aes(x=Remuneration, y=Loyalty_points)) + 
  geom_point(alpha = 0.75, size = 1.5) + 
  geom_smooth(method = "lm", se = FALSE, color = "dark green") + 
  scale_x_continuous(breaks = seq(0, 120, 20)) + 
  scale_y_continuous(breaks = seq(0, 7000, 500)) + 
  labs(x = "Remuneration ($k)",
       y = "Number of Loyalty Points",
       title = "Relationship between Loyalty Points and Remuneration",
       caption = "Source: Turtle Games") + 
  theme_classic()

# There is a positive relationship between the 'Loyalty_points' and 'Remuneration' variables, 
# indicating that as remuneration increases, so do loyalty points; most likely because a customer with a 
# higher level of remuneration is likely to have more disposable income to spend on games. This is 
# important for Turtle Games to know because they will likely want to target their marketing toward 
# those customers with higher levels of remuneration, to encourage them to spend more money.


# Plot the loyalty points variable against the spending score variable (scatterplot).
ggplot(reviews_nec_col, 
       mapping=aes(x=Spending_score, y=Loyalty_points)) + 
  geom_point(alpha = 0.75, size = 1.5) + 
  geom_smooth(method = "lm", se = FALSE, color = "dark green") + 
  scale_x_continuous(breaks = seq(0, 100, 10)) + 
  scale_y_continuous(breaks = seq(0, 7000, 500)) + 
  labs(x = "Spending_score (1-100)",
       y = "Number of Loyalty Points",
       title = "Relationship between Loyalty Points and Spending Score",
       caption = "Source: Turtle Games") + 
  theme_classic()

# There is a positive relationship between the 'Loyalty_points' and 'Spending-score' variables, 
# indicating that as spending scores increase, so do loyalty points. This makes sense, as a customer's 
# spending score is directly linked to their spending nature and behaviour (as explained in the 
# metadata). Therefore, this finding is likely to be reaffirm what Turtle Games already knows, but is 
# unlikely to be all that useful toward decision-making.


# Q3: Can you comment on the distributions of remuneration and spending score values?

# Plot the remuneration variable on a histogram.
ggplot(reviews_nec_col, aes(x = Remuneration, y = ..count../sum(..count..))) + 
  geom_histogram(fill = "dark green", color = "black", binwidth = 10) + 
  stat_bin(geom = "text", aes(label = scales::percent(..count../sum(..count..), accuracy = 0.1)), 
           vjust = -0.5, binwidth = 10) + 
  scale_y_continuous(labels = scales::percent) + 
  ylim(0, 0.3) + 
  labs(x = "Remuneration ($k)",
       y = "Percent of Customers",
       title = "Distribution of Customers by Remuneration Levels",
       caption = "Source: Turtle Games") +
  theme_classic()

# Most remuneration values are distributed between $10k and $20k and between $30k and $60k, representing 
# 65% of customers. A further 5% of customers earn less than $10k and a further 10% of customers earn 
# between $20k and $30k. The remainder (approximately 20% of customers) earn above $60k. These results 
# are important for Turtle Games, because they indicate that most customers (circa 80%) earn less than
# $60k. Customers earning above $60k appear to represent attractive potential target segments because 
# they generally accumulate more loyalty points


# Plot the spending score variable on a histogram.
ggplot(reviews_nec_col, aes(x = Spending_score, y = ..count../sum(..count..))) + 
  geom_histogram(fill = "dark green", color = "black", binwidth = 10) + 
  stat_bin(geom = "text", aes(label = scales::percent(..count../sum(..count..), accuracy = 0.1)), 
           vjust = -0.5, binwidth = 10) + 
  scale_y_continuous(labels = scales::percent) + 
  ylim(0, 0.3) + 
  labs(x = "Spending Score (1-100)",
       y = "Percent of Customers",
       title = "Distribution of Customers by Spending Scores",
       caption = "Source: Turtle Games") +
  theme_classic()

# 40% of spending score values are distributed between scores of 0-50, 21% of values are distributed 
# between scores of 50-60, and 39% of values are distributed between scores of 60-100. The distributions 
# are fairly even, except for the 21% of customers (approximately 1/5) that have a score value of 50-60.
# These results are important for Turtle Games, because they indicate that 40% of customers have 
# spending scores that are lower than half the highest potential score, and 21% of customers have 
# spending scores that are approximately half the highest potential score. Turtle Games is likely to 
# want to try to influence increases in spending scores, but as this variable is directly linked 
# to customer spending natures and behaviours (as explained in the metadata), the only way Turtle Games 
# is likely to be able to do this is to successfully encourage customers to spend more. Therefore, this 
# insight is unlikely to be useful in decision-making. However, by regularly reviewing spending scores 
# Turtle Games could determine whether their efforts to increase sales, and therefore, spending scores, 
# are proving effective.


# Q4: Are there any groupings that may be useful in gaining deeper insights into customer behaviour?

# Subset by the three predetermined customer clusters with the greatest spending potential.

# Moderate earners, moderate spenders (cluster 1): Remuneration = $30k-$60k, Spending_score = 40-60
# High earners, low spenders (cluster 0): Remuneration = $60k-$100k+, Spending_score = 0-40
# High earners, high spenders (cluster 2): Remuneration = $60k-$100k+, Spending_score = 60-100

# Subset the reviews_nec_col data to show only those customers in the 'moderate earners, moderate 
# spenders' cluster.
mod_earn_mod_spend <- reviews_nec_col %>%
  filter(Remuneration >= 30 & Remuneration < 60,
         Spending_score >= 40 & Spending_score < 60)

# View the subset.
View(mod_earn_mod_spend)

# Check the dimensions of the subset.
dim(mod_earn_mod_spend)

# Calculate the count, mean, median, and SD of the loyalty points values of the 'moderate earners, 
# moderate spenders' cluster.

mod_earn_mod_spend %>%
  summarize(
    # Loyalty Points
    loyalty_points_count = n(),
    loyalty_points_mean = mean(Loyalty_points),
    loyalty_points_median = median(Loyalty_points),
    loyalty_points_sd = sd(Loyalty_points))

# K-means clustering identified 774 customers in the 'moderate earners, moderate spenders' cluster. 
# To validate these findings, I have created a manual subset using strict boundaries 
# (Remuneration $30k-60k, Spending Score 40-60), which captured 705 customers. The following descriptive 
# statistics analyse the conservative subset:

# On average, customers have 1,422 loyalty points each, and the middle customer has 1,390 points.
# The mean and median values are quite close, which indicates that the distribution of loyalty points is 
# fairly symmetrical. The standard deviation of 320 can be subtracted from the mean 
# (1,422 - 320 = 1,102) and added to the mean (1,422 + 320 = 1,742), informing us that most customers 
# have loyalty point values of between 1,102 and 1,742. This is important to Turtle Games because the 
# closeness of the mean and median values confirms that the customers in this cluster behave similarly 
# to each other, the mean of 1,422 indicates moderate loyalty (consistent with the cluster's name), and 
# the standard deviation of 320 (which is relatively small, compared with the mean) indicates that the 
# segment is stable, and therefore, predictable. Turtle Games can probably rely on this cluster's 
# continued level of business.


# Subset the reviews_nec_col data to show only those customers in the 'high earners, low spenders' 
# cluster.
high_earn_low_spend <- reviews_nec_col %>%
  filter(Remuneration >= 60,
         Spending_score >= 0 & Spending_score < 40)

# View the subset.
View(high_earn_low_spend)

# Check the dimensions of the subset.
dim(high_earn_low_spend)

# Calculate the count, mean, median, and SD of the loyalty points values of the 'high earners, low 
# spenders' cluster.

high_earn_low_spend %>%
  summarize(
    # Loyalty Points
    loyalty_points_count = n(),
    loyalty_points_mean = mean(Loyalty_points),
    loyalty_points_median = median(Loyalty_points),
    loyalty_points_sd = sd(Loyalty_points))

# K-means clustering identified 356 customers in the 'high earners, low spenders' cluster. 
# To validate these findings, I have created a manual subset using strict boundaries 
# (Remuneration $60k+, Spending Score 0-40), which captured 295 customers. The following descriptive 
# statistics analyse the conservative subset:

# On average, customers have 967 loyalty points each, and the middle customer has 925 points.
# The mean and median values are quite close, which indicates that the distribution of loyalty points is 
# fairly symmetrical. The standard deviation of 544 can be subtracted from the mean 
# (967 - 544 = 423) and added to the mean (967 + 544 = 1,511), informing us that most customers 
# have loyalty point values of between 423 and 1,511. This is important to Turtle Games because the 
# closeness of the mean and median values confirms that the customers in this cluster behave similarly 
# to each other, the mean of 967 indicates low loyalty (consistent with the cluster's name), and 
# the standard deviation of 544 (which is relatively big, compared with the mean) indicates that the 
# segment is less stable than the 'moderate earners, moderate spenders' cluster, and therefore, less 
# predictable. Turtle Games may be less able to rely on this cluster's continued level of business, so 
# they should take care not to alienate them with unsuitable targeted marketing efforts.


# Subset the reviews_nec_col data to show only those customers in the 'high earners, high spenders' 
# cluster.
high_earn_high_spend <- reviews_nec_col %>%
  filter(Remuneration >= 60,
         Spending_score >= 60)

# View the subset.
View(high_earn_high_spend)

# Check the dimensions of the subset.
dim(high_earn_high_spend)

# Calculate the count, mean, median, and SD of the loyalty points values of the 'high earners, high 
# spenders' cluster.

high_earn_high_spend %>%
  summarize(
    # Loyalty Points
    loyalty_points_count = n(),
    loyalty_points_mean = mean(Loyalty_points),
    loyalty_points_median = median(Loyalty_points),
    loyalty_points_sd = sd(Loyalty_points))

# K-means clustering identified 330 customers in the 'high earners, high spenders' cluster. 
# To validate these findings, I have created a manual subset using strict boundaries 
# (Remuneration $60k+, Spending Score 60+), which captured 300 customers. The following descriptive 
# statistics analyse the conservative subset:

# On average, customers have 4,139 loyalty points each, and the middle customer has 3,973 points.
# The mean and median values are quite close, which indicates that the distribution of loyalty points is 
# fairly symmetrical. The standard deviation of 887 can be subtracted from the mean 
# (4,139 - 887 = 3,252) and added to the mean (4,139 + 887 = 5,026), informing us that most customers 
# have loyalty point values of between 3,252 and 5,026. This is important to Turtle Games because the 
# closeness of the mean and median values confirms that the customers in this cluster behave similarly 
# to each other, the mean of 4,139 indicates high loyalty (consistent with the cluster's name), and 
# the standard deviation of 887 (which is relatively small, compared with the mean) indicates that the 
# segment is stable, and therefore, predictable. Turtle Games can probably rely on this cluster's 
# continued level of business.


# 6. Summarise the most important business insights, any patterns or trends that may warrant further 
# investigation, and any recommended future actions:

# This analysis indicates that loyalty points are unevenly distributed across Turtle Games' customer 
# base, with approximately 75% of customers having fewer than 2,000 points each. The distribution of 
# loyalty points is positively skewed, suggesting that a relatively small number of customers account 
# for a disproportionately large share of loyalty point accumulation.

# The visualisations confirm strong positive relationships between loyalty points, remuneration, and 
# spending scores. This supports the findings from analyses undertaken in Python, which identified 
# remuneration and spending score as the strongest predictors of loyalty point accumulation. Therefore, 
# customers with higher remuneration levels and spending scores appear to represent valuable marketing 
# opportunities.

# Analysis of the customer segments identified through k-means clustering suggests that the ‘high 
# earners, high spenders’ cluster represents the most loyal and predictable customers, whilst the 
# ‘high earners, low spenders’ cluster represent the least loyal and predictable. There may be an 
# opportunity to target marketing toward customers in the latter cluster to increase spending and 
# engagement, but care should be taken not to alienate them, or business could be lost.

# Future analyses should investigate factors driving loyalty point accumulation among the highest 
# value customers and explore whether marketing initiatives result in measurable increases in loyalty, 
# spending, or retention.


########################################################################################################
########################################################################################################

# Assignment 6 scenario

## In Module 5, you were requested to redo components of the analysis using Turtle Games’s preferred 
## language, R, in order to make it easier for them to implement your analysis internally. As a final 
## task the team asked you to perform a statistical analysis and create a multiple linear regression 
## model using R to predict loyalty points using the available features in a multiple linear model. 
## They did not prescribe which features to use and you can therefore use insights from previous modules 
## as well as your statistical analysis to make recommendations regarding suitability of this model type,
## the specifics of the model you created and alternative solutions. As a final task they also requested 
## your observations and recommendations regarding the current loyalty programme and how this could be 
## improved. 

########################################################################################################

## Assignment 6 objective
## You need to investigate customer behaviour and the effectiveness of the current loyalty program based 
## on the work completed in modules 1-5 as well as the statistical analysis and modelling efforts of module 6.
##  - Can we predict loyalty points given the existing features using a relatively simple MLR model?
##  - Do you have confidence in the model results (Goodness of fit evaluation)
##  - Where should the business focus their marketing efforts?
##  - How could the loyalty program be improved?
##  - How could the analysis be improved?

########################################################################################################

## Assignment 6 assignment: Making recommendations to the business.

## 1. Continue with your R script in RStudio from Assignment Activity 5: Cleaning, manipulating, and 
##     visualising the data.
## 2. Load and explore the data, and continue to use the data frame you prepared in Module 5.
## 3. Perform a statistical analysis and comment on the descriptive statistics in the context of the 
##     review of how customers accumulate loyalty points.
##  - Comment on distributions and patterns observed in the data.
##  - Determine and justify the features to be used in a multiple linear regression model and potential
##.    concerns and corrective actions.
## 4. Create a Multiple linear regression model using your selected (numeric) features.
##  - Evaluate the goodness of fit and interpret the model summary statistics.
##  - Create a visual demonstration of the model
##  - Comment on the usefulness of the model, potential improvements and alternate suggestions that could 
##     be considered.
##  - Demonstrate how the model could be used to predict given specific scenarios. (You can create your own 
##     scenarios).
## 5. Perform exploratory data analysis by using statistical analysis methods and comment on the descriptive 
##     statistics in the context of the review of how customers accumulate loyalty points.
## 6. Document your observations, interpretations, and suggestions based on each of the models created in 
##     your notebook. (This will serve as input to your summary and final submission at the end of the course.)

########################################################################################################

# Your code here.

# 1. Import all the required libraries:
library(moments)
library(corrplot)


# 2. Explore the data:
summary(reviews_nec_col)


# 3. Perform a statistical analysis and comment on the descriptive statistics in the context of the 
# review of how customers accumulate loyalty points:

    # Comment on distributions and patterns observed in the data.
    # Repeated from assignment activity 5.

# Plot the loyalty points variable on a histogram.
ggplot(reviews_nec_col, aes(x = Loyalty_points, y = ..count../sum(..count..))) + 
  geom_histogram(fill = "dark green", color = "black", binwidth = 500) + 
  stat_bin(geom = "text", aes(label = scales::percent(..count../sum(..count..), accuracy = 0.1)), 
           vjust = -0.5, binwidth = 500) + 
  scale_y_continuous(labels = scales::percent) + 
  ylim(0, 0.30) + 
  labs(x = "Number of Loyalty Points",
       y = "Percent of Customers",
       title = "Distribution of Customers by Number of Loyalty Points",
       caption = "Source: Turtle Games") +
  theme_classic()

# Most of the loyalty point values are distributed between 500 and 2,000, representing 66% of customers.
# A further 9% of customers have between 0 and 500 loyalty points each. The remainder (approximately 25% 
# of customers) have between 2,000 and 7,000 loyalty points each. These results are important for Turtle 
# Games, because they indicate that most customers (circa 75%) are not highly engaged with the loyalty 
# points programme. Turtle Games is likely to want more customers to acquire higher numbers of loyalty 
# points, because this would mean that the customers are spending greater amounts of money and/or 
# spending more often.


    # Determine and justify the features to be used in a multiple linear regression model and 
    # potential concerns and corrective actions.
    # Partially repeated from assignment activity 5.

# Plot the loyalty points variable against the remuneration variable (scatterplot).
ggplot(reviews_nec_col, 
       mapping=aes(x=Remuneration, y=Loyalty_points)) + 
  geom_point(alpha = 0.75, size = 1.5) + 
  geom_smooth(method = "lm", se = FALSE, color = "dark green") + 
  scale_x_continuous(breaks = seq(0, 120, 20)) + 
  scale_y_continuous(breaks = seq(0, 7000, 500)) + 
  labs(x = "Remuneration ($k)",
       y = "Number of Loyalty Points",
       title = "Relationship between Loyalty Points and Remuneration",
       caption = "Source: Turtle Games") + 
  theme_classic()

# There is a positive relationship between the 'Loyalty_points' and 'Remuneration' variables, 
# indicating that as remuneration increases, so do loyalty points; most likely because a customer with a 
# higher level of remuneration is likely to have more disposable income to spend on games. This is 
# important for Turtle Games to know because they will likely want to target their marketing toward 
# those customers with higher levels of remuneration, to encourage them to spend more money.


# Plot the loyalty points variable against the spending score variable (scatterplot).
ggplot(reviews_nec_col, 
       mapping=aes(x=Spending_score, y=Loyalty_points)) + 
  geom_point(alpha = 0.75, size = 1.5) + 
  geom_smooth(method = "lm", se = FALSE, color = "dark green") + 
  scale_x_continuous(breaks = seq(0, 100, 10)) + 
  scale_y_continuous(breaks = seq(0, 7000, 500)) + 
  labs(x = "Spending_score (1-100)",
       y = "Number of Loyalty Points",
       title = "Relationship between Loyalty Points and Spending Score",
       caption = "Source: Turtle Games") + 
  theme_classic()

# There is a positive relationship between the 'Loyalty_points' and 'Spending-score' variables, 
# indicating that as spending scores increase, so do loyalty points. This makes sense, as a customer's 
# spending score is directly linked to their spending nature and behaviour (as explained in the 
# metadata). Therefore, this finding is likely to be reaffirm what Turtle Games already knows, but is 
# unlikely to be all that useful toward decision-making.


# Plot the loyalty points variable against the age variable (scatterplot).
ggplot(reviews_nec_col, 
       mapping=aes(x=Age, y=Loyalty_points)) + 
  geom_point(alpha = 0.75, size = 1.5) + 
  geom_smooth(method = "lm", se = FALSE, color = "dark green") + 
  scale_x_continuous(breaks = seq(0, 100, 10)) + 
  scale_y_continuous(breaks = seq(0, 7000, 500)) + 
  labs(x = "Age",
       y = "Number of Loyalty Points",
       title = "Relationship between Loyalty Points and Age",
       caption = "Source: Turtle Games") + 
  theme_classic()

# There is a weak negative relationship between the 'Loyalty_points' and 'Age' variables, indicating 
# that as age increases, loyalty points slightly decrease. This appears to be insignificant toward 
# explaining how customers accumulate loyalty points.


# Plot the loyalty points and gender variables on a boxplot.

ggplot(reviews_nec_col, aes(x = Gender, y = Loyalty_points)) + 
  geom_boxplot(fill = "dark green") + 
  labs(x = "Gender",
       y = "Number of Loyalty Points",
       title = "Distribution of Loyalty Points by Gender",
       caption = "Source: Turtle Games") +
  theme_classic()

# The boxplots suggest that loyalty points may be positively/ right-skewed for male and female customers. 
# Their medians and interquartile ranges appear broadly similar, indicating limited visible differences 
# in the typical loyalty-point distributions for these groups.


# Plot the loyalty points and education variables on a boxplot.

ggplot(reviews_nec_col, aes(x = Education, y = Loyalty_points)) + 
  geom_boxplot(fill = "dark green") + 
  labs(x = "Education",
       y = "Number of Loyalty Points",
       title = "Distribution of Loyalty Points by Education",
       caption = "Source: Turtle Games") +
  theme_classic()

# The boxplots suggest that loyalty points may be positively/ right-skewed for customers in the diploma, 
# graduate, PhD, and postgraduate groups. Their medians and interquartile ranges appear broadly similar, 
# indicating limited visible differences in the typical loyalty-point distributions for these groups. 
# The basic education group appears to have higher quartiles and greater variability, suggesting a 
# possible difference in loyalty-point accumulation compared with the other education groups.


# Drop unnecessary columns for correlation analysis.
numeric_data <- reviews_nec_col %>%
  select_if(is.numeric)

# Calculate the correlation matrix.
correlation_matrix <- cor(numeric_data, use = "complete.obs")

# Create the correlation plot.
corrplot(correlation_matrix, method = "circle")

# View the correlation matrix.
correlation_matrix

# The correlation matrix informs us that the spending score and remuneration variables both have strong, 
# positive correlation with the loyalty points variable, whilst the age variable has weak negative 
# correlation with the loyalty points variable. The product variable can be ignored, because whilst 
# it contains numeric values, they represent product codes (identifiers).

# Following the visualisation of relationships between the dependent variable (loyalty points) and the 
# independent variables (remuneration, spending score, age, gender, and education), the decision is to 
# use the remuneration and spending score variables in the multiple linear regression model. This is 
# because these appear to be the only variables with strong relationships with loyalty points, so by 
# using these we are likely to achieve greater predictive accuracy in our model.


## 4. Create a Multiple linear regression model using your selected (numeric) features.

    # Evaluate the goodness of fit and interpret the model summary statistics.

# Create the multiple linear regression model.
model <- lm(Loyalty_points ~ Remuneration + Spending_score, data = reviews_nec_col)

# Summarise the model.
summary(model)

# Residuals: The median of 40.34 is relatively close to 0, suggesting that the model has little overall  
# bias, with only a slight tendency to under-predict loyalty points. The middle 50% of prediction errors 
# are between -363.66 and 280.59 points. At the quartile boundaries, this corresponds to an over-
# prediction of approximately 364 points or an under-prediction of approximately 281 points. However, 
# the minimum (-1646.02) and maximum (1999.95) residual values show that some errors are much larger.

# Coefficients: The p-values for both the remuneration and spending score variables are very low, 
# meaning they are statistically significant (as indicated by the *** next to the values).

# R-squared: The multiple R-squared value is 0.8269 and the adjusted R-squared value is 0.8267. The 
# adjusted R-squared is always lower and more accurate than the multiple R-squared, so this value will 
# be chosen. Regardless, both the multiple and adjusted R-squared values indicate that the model's 
# predictive accuracy is 82-83%, which is a good result.

    # Create a visual demonstration of the model.

# Plot actual vs. predicted values with a different smoothing method if necessary
ggplot(reviews_nec_col, aes(x = Loyalty_points, y = predict(model, reviews_nec_col))) +
  geom_point() +
  stat_smooth(method = "loess") +
  labs(x = 'Actual Loyalty Points', y = 'Predicted Loyalty Points') +
  ggtitle('Actual vs. Predicted Loyalty Points')

    # Comment on the usefulness of the model, potential improvements and alternate suggestions that 
    # could be considered.

# The model is very useful as it predicts 83% of variation in the data set. However, 17% is unaccounted 
# for and it is unlikely that Turtle Games would be able to improve the model's accuracy through use of 
# the available data (because age has been shown to be statistically insignificant). Therefore, to 
# improve the model's accuracy, additional data may need to be collected and applied to the model.
# Turtle Games could also collect and test categorical variables (education, occupation, marital status, 
# etc.) through application of logistic regression, decision trees, or random forests.


# 5. Perform exploratory data analysis by using statistical analysis methods and comment on the 
# descriptive statistics in the context of the review of how customers accumulate loyalty points.

    # Demonstrate how the model could be used to predict given specific scenarios.

# Predict the loyalty point value for customers with Remuneration of $50k and Spending_scores of 50.
prediction_1 <- predict(model, newdata = data.frame(
  Remuneration = 50,
  Spending_score = 50
))
print(prediction_1)

# Customers who earn $50k and who have spending scores of 50 are predicted to have loyalty point values 
# of 1643.


# Predict the loyalty point value for customers with Remuneration of $80k and Spending_scores of 30.
prediction_2 <- predict(model, newdata = data.frame(
  Remuneration = 80,
  Spending_score = 30
))
print(prediction_2)

# Customers who earn $80k and who have spending scores of 30 are predicted to have loyalty point values 
# of 2001.


# Predict the loyalty point value for customers with Remuneration of $80k and Spending_scores of 80.
prediction_3 <- predict(model, newdata = data.frame(
  Remuneration = 80,
  Spending_score = 80
))
print(prediction_3)

# Customers who earn $80k and who have spending scores of 80 are predicted to have loyalty point values 
# of 3649.


# 6. Document your observations, interpretations, and suggestions based on each of the models created in 
# your notebook.

# The multiple linear regression model indicates that loyalty points can be predicted with a high level 
# of accuracy by using the remuneration and spending score variables. Both variables were identified as 
# statistically significant predictors of loyalty point accumulation, whilst the age, gender, and 
# education variables appeared to have limited explanatory value. The model achieved an adjusted 
# R-squared value of 0.83, indicating that approximately 83% of variation in loyalty points can be 
# explained by the selected features (remuneration and spending score). This suggests that Turtle Games 
# can have confidence in the model's results and use them to support decision-making.

# The model confirms that customers with higher remuneration and spending scores are more likely to 
# accumulate loyalty points. Consequently, marketing efforts should focus on encouraging greater 
# spending amongst high-earning customers, and particularly those who currently exhibit relatively low 
# spending behaviour (as evidenced by low spending scores). Turtle Games should also consider 
# strengthening its loyalty programme through spend-based rewards and incentives designed to increase 
# customer engagement.

# Although the model performs well, approximately 17% of variation remains unexplained. Future analyses 
# should therefore investigate additional customer characteristics, e.g., occupation, marital status, 
# etc. and alternative modelling techniques to determine whether predictive accuracy can be improved 
# further.


########################################################################################################
########################################################################################################

