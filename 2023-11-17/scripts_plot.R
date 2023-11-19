# Load necessary libraries
library(dplyr)

# Read the data files
bpm_data <- read.csv("C:/Users/houqi/Downloads/2023-11-17/BPM_2023-11-17.csv")
darko_data <- read.csv("C:/Users/houqi/Downloads/2023-11-17/DARKO_player_talent_2023-11-17.csv")

# Merging the datasets on the Player column
merged_data <- merge(bpm_data, darko_data, by = "Player", all = FALSE)

# Removing duplicates
plot_data_unique <- merged_data %>% distinct(Player, .keep_all = TRUE)


# Arrange data to find the top 10 players in BPM
top_players <- plot_data_unique %>%
  arrange(desc(BPM)) %>%
  head(20)
# DPM vs BPM with labels for top 10 players
ggplot(plot_data_unique, aes(x = DPM, y = BPM)) +
  geom_point(color = "blue", size = 3) +
  geom_text(data = top_players, aes(label = Player), nudge_y = -0.2, check_overlap = TRUE, color = "darkred") +
  ggtitle("DPM vs BPM") +
  xlab("DPM") +
  ylab("BPM") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# O-DPM vs OBPM
ggplot(plot_data_unique, aes(x = O.DPM, y = OBPM)) +
  geom_point(color = "forestgreen", size = 3) +
  geom_text(data = top_players, aes(label = Player), nudge_y = -0.2, check_overlap = TRUE, color = "darkred") +
  ggtitle("O-DPM vs OBPM") +
  xlab("O-DPM") +
  ylab("OBPM") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# D-DPM vs DBPM
ggplot(plot_data_unique, aes(x = D.DPM, y = DBPM)) +
  geom_point(color = "purple", size = 3) +
  geom_text(data = top_players, aes(label = Player), nudge_y = -0.2, check_overlap = TRUE, color = "darkred") +
  ggtitle("D-DPM vs DBPM") +
  xlab("D-DPM") +
  ylab("DBPM") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

