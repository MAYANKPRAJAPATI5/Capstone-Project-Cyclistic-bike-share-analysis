# Install required packages
install.packages("tidyverse")
install.packages("lubridate")
install.packages("ggplot2")

# Load required packages
library(tidyverse)
library(lubridate)
library(ggplot2)

# Set working directory
setwd("C:/Users/dell/OneDrive/Desktop/Cyclistic_Project/Cyclistic_Project")

# Collect Data
q2_2019 <- read_csv("Divvy_Trips_2019_Q2.csv")
q3_2019 <- read_csv("Divvy_Trips_2019_Q3.csv")
q4_2019 <- read_csv("Divvy_Trips_2019_Q4.csv")
q1_2020 <- read_csv("Divvy_Trips_2020_Q1.csv")

# Combine Data
all_trips <- bind_rows(q2_2019, q3_2019, q4_2019, q1_2020) %>%
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender, "01 - Rental Details Duration In Seconds Uncapped",
            "05 - Member Details Member Birthday Year", "Member Gender", "tripduration"))

# Clean up and Prepare Data
all_trips <- all_trips %>%
  rename(
    ride_id = trip_id,
    rideable_type = bikeid,
    started_at = start_time,
    ended_at = end_time,
    start_station_name = from_station_name,
    start_station_id = from_station_id,
    end_station_name = to_station_name,
    end_station_id = to_station_id,
    member_casual = usertype
  ) %>%
  mutate(
    ride_id = as.character(ride_id),
    rideable_type = as.character(rideable_type),
    date = as.Date(started_at),
    month = format(date, "%m"),
    day = format(date, "%d"),
    year = format(date, "%Y"),
    day_of_week = format(date, "%A"),
    ride_length = as.numeric(difftime(ended_at, started_at))
  )

# Remove "bad" data
all_trips_v2 <- all_trips %>%
  filter(!(start_station_name == "HQ QR" | ride_length < 0))

# Conduct Descriptive Analysis
mean_ride_length <- mean(all_trips_v2$ride_length)
median_ride_length <- median(all_trips_v2$ride_length)
max_ride_length <- max(all_trips_v2$ride_length)
min_ride_length <- min(all_trips_v2$ride_length)

average_duration_by_user <- aggregate(ride_length ~ member_casual, data = all_trips_v2, FUN = mean)
average_duration_by_user_and_day <- aggregate(ride_length ~ member_casual + day_of_week, data = all_trips_v2, FUN = mean)

# Visualize the average duration by each day for members vs casual users
all_trips_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday) %>%
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")

# Export Summary File for further analysis
counts <- aggregate(ride_length ~ member_casual + day_of_week, data = all_trips_v2, FUN = mean)
write.csv(counts, file = "C:/Users/dell/OneDrive/Desktop/Cyclistic_Project/Cyclistic_Project/avg_ride_length.csv")

