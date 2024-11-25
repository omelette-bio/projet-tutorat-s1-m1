# Charger ggplot2
library(ggplot2)
library(dplyr)

data <- read.csv("time_datas/01.csv")

label_positions <- data %>%
  group_by(optimisation, compilateur) %>%
  summarize(
    max_temps = max(temps), # La position maximale pour placer le label
    .groups = "drop"
  )


# Créer le boxplot
p <- ggplot(data, aes(x = optimisation, y = temps, fill = compilateur)) +
  geom_boxplot(outlier.shape = NA) +
  geom_vline(xintercept = positions_separation, color = "gray") +
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
  scale_fill_brewer(palette = "Set3") # Palette de couleurs

print(p)