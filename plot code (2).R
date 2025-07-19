install.packages("munsell")
library(munsell)
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
ggplot(shimla, aes(x = as.Date(Date), y = Max_Temp)) +
  geom_line(color = "blue") +
  labs(title = "Maximum Temperature in Shimla (2020–2025)",
       x = "Date", y = "Max Temperature (°C)") +
  theme_minimal()
combined <- bind_rows(shimla, srinagar, pune)

# Line plot comparison
ggplot(combined, aes(x = as.Date(Date), y = Max_Temp, color = City)) +
  geom_line(alpha = 0.7) +
  labs(title = "Max Temperature Comparison (2020–2025)",
       x = "Date", y = "Max Temperature (°C)") +
  theme_minimal()
combined %>%
  group_by(City) %>%
  summarise(Avg_Precipitation = mean(Precipitation, na.rm = TRUE)) %>%
  ggplot(aes(x = City, y = Avg_Precipitation, fill = City)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Precipitation (2020–2025)", y = "Precipitation (mm)") +
  theme_minimal()
combined$Month <- format(as.Date(combined$Date), "%Y-%m")

monthly_avg <- combined %>%
  group_by(City, Month) %>%
  summarise(Avg_Max_Temp = mean(Max_Temp, na.rm = TRUE))

ggplot(monthly_avg, aes(x = Month, y = Avg_Max_Temp, color = City, group = City)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Monthly Average Max Temperature",
       x = "Month", y = "Temp (°C)")

ggsave("max_temp_comparison.png", width = 10, height = 6)


