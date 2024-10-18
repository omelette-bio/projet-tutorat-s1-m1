# Step 1: Manually create your dataset (alternatively, read from a file)
data <- read.csv("time_data.csv")

# Step 2: Create the boxplot, grouping by 'Compiler'
boxplot(Time ~ Compilation, data = data,
        main = "Comparaison des temps d'execution pour matrix_multiply.c",
        ylab = "Temps (secondes)",
        xlab = "Compilateur et niveau d'optimisation",
        col = "lightblue")

