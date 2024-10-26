library(ggplot2)

# Step 1: Read the CSV file
data <- read.csv("time_data_backup.csv")

# Step 2: Create the boxplot with ggplot2, using facet_grid to separate by optimisation level
# Create the plot and store it in a variable
p <- ggplot(data, aes(x = compilation, y = temps, fill = compilation)) +
  geom_boxplot() +
  facet_grid(. ~ optimisation, scales = "free_x", space = "free_x") +
  labs(title = "Comparaison du Temps d'execution de matrix_multiply par Compilateur et Niveau d'Optimisation",
       x = "Compilateur",
       y = "Temps (secondes)") +
  theme_minimal() +
  theme(panel.spacing = unit(1, "lines"), strip.text = element_text(face = "bold"), legend.position = "none") +
  scale_fill_brewer(palette = "Pastel1")

# Print the plot
print(p)

