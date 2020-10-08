library(readr)
library(tidyverse)
library(readxl)
library(jsonlite)

contribution <- read_csv("./data/contribution.csv")
contribution <- dplyr::rename(contribution, Vita=End, Country = country) %>%
  dplyr::select(-c(2:8))%>% dplyr::select(-5) %>% dplyr::select(-Special)
contribution_json <- toJSON(contribution, encoding="UTF-8")
con <- file("data/contribution.json",encoding="UTF-8")
write(contribution_json, con)
