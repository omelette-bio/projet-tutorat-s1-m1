library(ggplot2)
library(dplyr)

# Load the CSV and name it appropriately
my_data <- read.csv("../time_datas/time_data_mat_mult.csv")

# Calculate label positions for both maximum and minimum
# label_positions <- my_data %>%
#   group_by(optimisation, compilateur) %>%
#   summarize(
#     max_temps = max(temps),  # Top of the violin plot
#     .groups = "drop"
#   )

# positions_labels <- my_data %>%
#   group_by(optimisation, compilateur) %>%
#   summarise(
#     y_pos = min(temps) - 2, # Bottom for text labels
#     .groups = "drop"
#   )

# Calculate positions for vertical lines
unique_optimisations <- unique(my_data$optimisation)
line_positions <- seq(1.5, length(unique_optimisations) - 0.5, by = 1)

# Create the violin plot
p <- ggplot(my_data, aes(x = optimisation, y = temps, fill = compilateur)) +
  geom_violin(trim = FALSE, scale = "width", alpha = 0.8) +  # Violin plot
  geom_vline(xintercept = line_positions, color = "gray", linetype = "dashed") + # Add vertical lines
  labs(
    title = "Violin plots des temps par optimisation et compilateur",
    x = "Optimisation",
    y = "Temps"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3")  # Choose your color palette

# Print the plot
# print(p)

ggsave("../plots/violin_plot_mat_mult.png", plot = p, width = 10, height = 6, bg = "white")  # Ensure white background