data <- read.csv("time_data.csv")

boxplot(temps ~ compilation, data = data,
        main = "Comparaison des temps d'execution pour matrix_multiply.c",
        ylab = "Temps (secondes)",
        xlab = "Compilateur et niveau d'optimisation",
        col = "lightblue")

