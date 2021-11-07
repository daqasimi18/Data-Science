# Lab One

# Exercise 1: Create an R variable for each of the following datasets
# Compute summary stats for each quantitative variable, and make a frequency table for each categorical variable.

# Part A
P = c('blue', 'pink', 'blue', 'green', 'green', 'blue', 'pink', 'blue')
table(P)

# Part B
Q = c(3.9, 0, -4.6, -3.3, 2.2, 3.6, -2.9, -0.4, 0.9, 1.5)
mean(Q)
sd(Q)
var(Q)
summary(Q)

# Part C
R = c(0, 1, 2, 3, 'a', 'b', 'c')
table(R)
summary(R)

print('----------------------------------------------------------------------------------------------------------')

# Exercise 2.1: The following table contains data on the employment status of a sample of college students. 
# Create a dataframe via keyboard input to represent these data. Print your dataframe and verify that it is correct.
Age = c(19, 19, 34, 20, 20, 21, 21, 21, 23, 41, 30)
Major = c('Business', 'English', 'Business', 'Psychology', 'Psychology', 'History', 'Business', 'History', 'Psychology', 'Business', 'Physics')
Employment = c('Part time', 'Part time', 'Unemployed', 'Part time', 'Part time', 'Unemployed', 'Part time', 'Part time', 'Full time', 'Full time', 'Unemployed')
Work_hours = c(35, 30, 0, 19, 32, 0, 20, 15, 36, 50, 0)

data_frame = data.frame(Age, Major, Employment, Work_hours)
print(data_frame)

print('----------------------------------------------------------------------------------------------------------')

# Exercise 2.2: For each variable in the dataset above, make a display (or two!) and compute summary statistics.
# Use the builtin help feature to discover at least a couple of new ways to customize your displays and/or computation.
# For example, try to figure out how to make a 2-way table for your two categorical variables.
summary(data_frame$Age)
class(data_frame$Age)
summary(data_frame$Major)
class(data_frame$Major)
summary(data_frame$Employment)
class(data_frame$Employment)
summary(data_frame$Work_hours)
class(data_frame$Work_hours)

print('----------------------------------------------------------------------------------------------------------')

# Exercise 2.3: Extend the above experiment to rolling a fair 12-sided die 10 times and recording the mean. 
# Perform several trials of the experiment and plot histgrams showing the distribution of mean values.
mean = 0
rolls = 500
for (i in 1:rolls){
    mean[i] = mean(sample(1:12, 10, replace=TRUE))
}
hist(mean[1:10]); hist(mean[1:20]); hist(mean[1:200]); hist(mean[1:rolls])