library(tidyr)


data <- read.csv("athlete_events.csv", stringsAsFactors = FALSE)

data$Medal[is.na(data$Medal)] <- "No Medal"

data <- data %>% drop_na(ID,Name,Sex,Age,Height,Weight,Team,NOC,Games,Year,Season,City,Sport,Event)

write.csv(data, "olympic.csv", row.names = FALSE)