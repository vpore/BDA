#r1
# Create a data frame with employee details
employee_data <- data.frame(
    EmployeeID = c(1, 2, 3, 4, 5),
    Name = c("John", "Alice", "Bob", "Eve", "Charlie"),
    Age = c(30, 25, 28, 22, 35),
    Department = c("HR", "IT", "Finance", "Sales", "Marketing"),
    Salary = c(50000, 60000, 55000, 48000, 70000)
)

# Display the data frame
print(employee_data)

# Display a summary of the data
print(summary(employee_data))

#r2
set.seed(123) # for reproducibility
data <- data.frame(X = rnorm(100), Y = rnorm(100), Size = runif(100, 1, 10), Category = sample(letters[1:5], 100, replace = TRUE), Value = rpois(100, 5)) # nolint

# Scatterplot
plot(data$X, data$Y, main = "Scatterplot", xlab = "X-axis", ylab = "Y-axis")

# Bubble Chart
library(ggplot2)
ggplot(data, aes(x = X, y = Y, size = Size)) +
    geom_point() +
    labs(title = "Bubble Chart", x = "X-axis", y = "Y-axis") # nolint

# Bar Chart
barplot(table(data$Category), main = "Bar Chart", xlab = "Category", ylab = "Frequency") # nolint

# Dot Plot
stripchart(data$X, main = "Dot Plot", xlab = "X-axis")

# Histogram
hist(data$X, main = "Histogram", xlab = "X-axis")

# Box Plot
boxplot(data$X, main = "Box Plot")

# Pie Chart
pie(table(data$Category), main = "Pie Chart")


#r3
# Define the vector
values <- c(23, 45, 10, 34, 89, 20, 67, 99)

# Sort in ascending order
sorted_ascending <- sort(values)

# Sort in descending order
sorted_descending <- sort(values, decreasing = TRUE)

cat("Assending Order", sorted_ascending)
cat("\nDescending Order", sorted_descending)

# Create a bar plot to demonstrate the sorted values
par(mfrow = c(1, 2)) # Arrange two plots side by side

# Plot in ascending order
barplot(sorted_ascending, main = "Ascending Order", xlab = "Index", ylab = "Value") # nolint

# Plot in descending order
barplot(sorted_descending, main = "Descending Order", xlab = "Index", ylab = "Value") # nolint


#r4
# Create numeric vectors for each product's daily sales
bread_sales <- c(12, 3, 5, 11, 9)
milk_sales <- c(21, 27, 18, 20, 15)
cola_cans_sales <- c(10, 1, 33, 6, 12)
chocolate_bars_sales <- c(6, 7, 4, 13, 12)
detergent_sales <- c(5, 8, 12, 20, 23)

# Create a vector of days
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Visualize the data using bar plots
par(mfrow = c(2, 3)) # Arrange the plots in a 2x3 grid

# Bread sales
barplot(bread_sales, names.arg = days, main = "Bread Sales", xlab = "Day", ylab = "Units Sold") # nolint

# Milk sales
barplot(milk_sales, names.arg = days, main = "Milk Sales", xlab = "Day", ylab = "Units Sold") # nolint

# Cola Cans sales
barplot(cola_cans_sales, names.arg = days, main = "Cola Cans Sales", xlab = "Day", ylab = "Units Sold") # nolint

# Chocolate Bars sales
barplot(chocolate_bars_sales, names.arg = days, main = "Chocolate Bars Sales", xlab = "Day", ylab = "Units Sold") # nolint

# Detergent sales
barplot(detergent_sales, names.arg = days, main = "Detergent Sales", xlab = "Day", ylab = "Units Sold") # nolint


#r5
data <- data.frame(
    Subject = 1:6,
    Class = c(1, 2, 1, 2, 1, 2),
    Marks = c(56, 75, 48, 69, 84, 53)
)

# i) Create a subset of subjects less than 4
subset_result <- subset(data, Subject < 4)

# Show the subset result
print("Subset of subjects less than 4:")
print(subset_result)

# ii) Create a subset using [] brackets
subset_result2 <- data[data$Subject < 3 & data$Class == 2, ]

# Show the subset result
print("Subset using [] brackets:")
print(subset_result2)

plot(data$Subject, data$Marks, main = "Scatterplot", xlab = "X-axis", ylab = "Y-axis") # nolint

#r6
employee_data <- data.frame(
    "SrNo" = 1:10,
    "NameOfEmployees" = c("Vivek", "Karan", "James", "Soham", "Renu", "Farah", "Hetal", "Mary", "Ganesh", "Krish"), # nolint
    "Salaries" = c(21000, 55000, 67000, 50000, 54000, 40000, 30000, 70000, 20000, 15000) # nolint
)

# Display the employee_data data frame
print(employee_data)

# ii)
# Create a data frame for the new employees
new_employees <- data.frame(
    "SrNo" = 11:15,
    "NameOfEmployees" = c("John", "Sarah", "Emily", "Tom", "Lisa"),
    "Salaries" = c(48000, 60000, 52000, 45000, 58000)
)

# Combine the new data with the existing data
combined_data <- rbind(employee_data, new_employees)

# Display the combined data
print(combined_data)


# iii)
# Load the ggplot2 library for visualization
library(ggplot2)

# Create a bar chart to visualize salaries
p <- ggplot(combined_data, aes(x = NameOfEmployees, y = Salaries)) + # nolint
    geom_bar(stat = "identity") +
    labs(title = "Salaries of Employees", x = "Employee Names", y = "Salary")

print(p)


#r7
churn_data <- read.csv("ADS Datasets\\Churn_Modelling.csv", header = TRUE)

# Exploratory Data Analysis (EDA)
cat("First few rows of the dataset:\n")
print(head(churn_data))
cat("\nDataset structure:\n")
print(str(churn_data))
cat("\nSummary statistics for the dataset:\n")
print(summary(churn_data))

# Data Visualization
par(mfrow = c(2, 2)) # Arrange plots in a 2x2 grid

# Histogram for Age
hist(churn_data$Age, main = "Distribution of Age", xlab = "Age")

# Boxplot for CreditScore by Geography
boxplot(CreditScore ~ Geography, data = churn_data, main = "CreditScore by Geography") # nolint

# Barplot for Gender
barplot(table(churn_data$Gender), main = "Gender Distribution", xlab = "Gender")

# Pie chart for Churn Rate
churn_rate <- mean(churn_data$Exited) * 100
labels <- c("Churned", "Not Churned")
sizes <- c(churn_rate, 100 - churn_rate)
pie(sizes, labels, main = "Churn Rate", col = c("red", "green"))

# Churn Analysis
overall_churn_rate <- sum(churn_data$Exited) / nrow(churn_data) * 100
churn_by_geography <- aggregate(Exited ~ Geography, data = churn_data, FUN = function(x) sum(x) / length(x) * 100) # nolint
churn_by_gender <- aggregate(Exited ~ Gender, data = churn_data, FUN = function(x) sum(x) / length(x) * 100) # nolint

cat("\nOverall Churn Rate: ", overall_churn_rate, "%\n")
cat("\nChurn Rate by Geography:\n")
print(churn_by_geography)
cat("\nChurn Rate by Gender:\n")
print(churn_by_gender)


#r8
data(iris)

# Exploratory Data Analysis (EDA)
cat("First few rows of the dataset:\n")
head(iris)
cat("\nDataset structure:\n")
str(iris)
cat("\nSummary statistics for the dataset:\n")
summary(iris)

# Data Visualization
par(mfrow = c(2, 2)) # Arrange plots in a 2x2 grid

# Histogram for Sepal.Length
hist(iris$Sepal.Length, main = "Distribution of Sepal.Length", xlab = "Sepal.Length") # nolint

# Boxplot for Sepal.Length by Species
boxplot(Sepal.Length ~ Species, data = iris, main = "Boxplot of Sepal.Length by Species") # nolint

# Scatterplot for Sepal.Length vs. Sepal.Width
plot(iris$Sepal.Length, iris$Sepal.Width, pch = 19, col = iris$Species, main = "Sepal Length vs. Sepal Width", xlab = "Sepal Length", ylab = "Sepal Width") # nolint
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 19)

# Pair Plot
library(GGally)
ggpairs(iris, columns = 1:4, aes(color = Species))

# Statistical Analysis
cat("Mean of Sepal.Length by Species:\n")
aggregate(Sepal.Length ~ Species, data = iris, FUN = mean)

cat("\nCorrelation Matrix:\n")
cor(iris[, 1:4])


#r9
supermarket_data <- read.csv("ADS Datasets\\supermarket_sales.csv", header = TRUE) # nolint

# Exploratory Data Analysis (EDA)
cat("First few rows of the dataset:\n")
print(head(supermarket_data))
cat("\nDataset structure:\n")
print(str(supermarket_data))
cat("\nSummary statistics for the dataset:\n")
print(summary(supermarket_data))

# Data Visualization
par(mfrow = c(2, 2)) # Arrange plots in a 2x2 grid

# Histogram for Unit price
hist(supermarket_data$Unit.price, main = "Distribution of Unit Price", xlab = "Unit Price") # nolint

# Barplot for Branch
barplot(table(supermarket_data$Branch), main = "Branch Distribution", xlab = "Branch") # nolint

# Scatterplot for Quantity vs. `Unit price`
plot(supermarket_data$Quantity, supermarket_data$`Unit price`, pch = 19, main = "Quantity vs. Unit Price", xlab = "Quantity", ylab = "Unit Price") # nolint

# Barplot for Customer type
plot(supermarket_data$Quantity, supermarket_data$`Unit price`, pch = 19, main = "Quantity vs. Unit Price", xlab = "Quantity", ylab = "Unit Price", xlim = c(0, max(supermarket_data$Quantity)), ylim = c(0, max(supermarket_data$Unit.price))) # nolint

# Sales Analysis
total_sales_by_branch <- tapply(supermarket_data$`Total`, supermarket_data$Branch, sum) # nolint
top_selling_products <- names(sort(table(supermarket_data$Product.line), decreasing = TRUE)[1:5]) # nolint
gross_income_by_branch <- tapply(supermarket_data$gross.income, supermarket_data$Branch, sum) # nolint

cat("\nTotal Sales by Branch:\n")
print(total_sales_by_branch)
cat("\nTop Selling Products:\n")
print(top_selling_products)
cat("\nGross Income by Branch:\n")
print(gross_income_by_branch)


#r10
loan_data <- read.csv("ADS Datasets\\loan_data_set.csv", header = TRUE) # nolint

# Exploratory Data Analysis (EDA)
cat("First few rows of the dataset:\n")
print(head(loan_data))
cat("\nDataset structure:\n")
print(str(loan_data))
cat("\nSummary statistics for the dataset:\n")
print(summary(loan_data))

# Data Visualization
par(mfrow = c(2, 2)) # Arrange plots in a 2x2 grid

# Histogram for ApplicantIncome
hist(loan_data$ApplicantIncome, main = "Applicant Income Distribution", xlab = "Applicant Income") # nolint

# Barplot for Gender
barplot(table(loan_data$Gender), main = "Gender Distribution", xlab = "Gender")

# Scatterplot for ApplicantIncome vs. CoapplicantIncome
plot(loan_data$ApplicantIncome, loan_data$CoapplicantIncome, pch = 19, main = "Applicant Income vs. Coapplicant Income", xlab = "Applicant Income", ylab = "Coapplicant Income") # nolint

# Barplot for Loan_Status
barplot(table(loan_data$Loan_Status), main = "Loan Status Distribution", xlab = "Loan Status") # nolint

# Loan Approval Analysis
approval_by_gender <- table(loan_data$Gender, loan_data$Loan_Status)
approval_by_education <- table(loan_data$Education, loan_data$Loan_Status)
credit_history_approval <- table(loan_data$Credit_History, loan_data$Loan_Status) # nolint

cat("\nLoan Approval by Gender:\n")
print(approval_by_gender)
cat("\nLoan Approval by Education:\n")
print(approval_by_education)
cat("\nCredit History vs. Loan Approval:\n")
print(credit_history_approval)