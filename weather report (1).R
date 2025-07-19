# Install packages if needed
install.packages("httr")
install.packages("jsonlite")

library(httr)
library(jsonlite)

# SHIMLA
shimla_url <- paste0("https://archive-api.open-meteo.com/v1/archive?",
                     "latitude=31.1048&longitude=77.1734",
                     "&start_date=2020-01-01&end_date=2025-01-01",
                     "&daily=temperature_2m_max,temperature_2m_min,precipitation_sum",
                     "&timezone=Asia%2FKolkata")

shimla_response <- GET(shimla_url)
shimla_data <- fromJSON(content(shimla_response, "text"))
shimla <- as.data.frame(shimla_data$daily)
colnames(shimla) <- c("Date", "Max_Temp", "Min_Temp", "Precipitation")
shimla$City <- "Shimla"
write.csv(shimla, "Shimla_weather.csv", row.names = FALSE)

# SRINAGAR
srinagar_url <- paste0("https://archive-api.open-meteo.com/v1/archive?",
                       "latitude=34.0837&longitude=74.7973",
                       "&start_date=2020-01-01&end_date=2025-01-01",
                       "&daily=temperature_2m_max,temperature_2m_min,precipitation_sum",
                       "&timezone=Asia%2FKolkata")

srinagar_response <- GET(srinagar_url)
srinagar_data <- fromJSON(content(srinagar_response, "text"))
srinagar <- as.data.frame(srinagar_data$daily)
colnames(srinagar) <- c("Date", "Max_Temp", "Min_Temp", "Precipitation")
srinagar$City <- "Srinagar"
write.csv(srinagar, "Srinagar_weather.csv", row.names = FALSE)

# PUNE
pune_url <- paste0("https://archive-api.open-meteo.com/v1/archive?",
                   "latitude=18.5204&longitude=73.8567",
                   "&start_date=2020-01-01&end_date=2025-01-01",
                   "&daily=temperature_2m_max,temperature_2m_min,precipitation_sum",
                   "&timezone=Asia%2FKolkata")

pune_response <- GET(pune_url)
pune_data <- fromJSON(content(pune_response, "text"))
pune <- as.data.frame(pune_data$daily)
colnames(pune) <- c("Date", "Max_Temp", "Min_Temp", "Precipitation")
pune$City <- "Pune"
write.csv(pune, "Pune_weather.csv", row.names = FALSE)
 
