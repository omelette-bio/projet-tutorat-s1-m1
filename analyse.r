library(ggplot2)
library(dplyr)

# Load the CSV and name it appropriately
my_data <- read.csv("time_data.csv")

# Calculate label positions for both maximum and minimum
label_positions <- my_data %>%
  group_by(optimisation, compilateur) %>%
  summarize(
    max_temps = max(temps),  # Top of the boxplot
    .groups = "drop"
  )

positions_labels <- my_data %>%
  group_by(optimisation, compilateur) %>%
  summarise(
    y_pos = min(temps) - 2, # Bottom for text labels
    .groups = "drop"
  )

# Create the boxplot
p <- ggplot(my_data, aes(x = optimisation, y = temps, fill = compilateur)) +
  geom_boxplot(outlier.shape = NA) +
  geom_text(
    data = label_positions,
    aes(
      x = optimisation,
      y = max_temps + 0.5,
      label = compilateur,
      color = compilateur
    ),
    inherit.aes = FALSE,
    position = position_dodge(width = 0.75),
    vjust = 0
  ) +
  labs(
    title = "Boxplots des temps par optimisation et compilateur",
    x = "Optimisation",
    y = "Temps"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3")

# Print the plot
print(p)
