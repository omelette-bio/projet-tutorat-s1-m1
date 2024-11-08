library(ggplot2)

# Step 1: Read the CSV file
data <- read.csv("time_data_backup.csv")


# Create the plot and store it in a variable
p <- ggplot(data, aes(x = compilation, y = temps, fill = compilation)) +
  geom_violin(trim = FALSE) +  # Violin plot for density
  geom_boxplot(width = 0.1, color = "black", alpha = 0.5, outlier.shape = NA) +
  stat_summary(fun = mean, geom = "point", shape = 15, size = 1, color = "white") +
  facet_grid(. ~ optimisation, scales = "free_x", space = "free_x") +
  labs(title = "Comparaison du Temps de Compilation par Compilateur et Niveau d'Optimisation", # nolint
       x = "Compilateur",
       y = "Temps (secondes)") +
  theme_minimal() +
  theme(panel.spacing = unit(1, "lines"),
        strip.text = element_text(face = "bold"),
        legend.position = "none") +  # Removes the legend
  scale_fill_brewer(palette = "Pastel1")

# Print the plot
print(p)
