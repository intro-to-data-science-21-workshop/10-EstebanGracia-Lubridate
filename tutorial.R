library(tidyverse)
library(legislatoR)
library(lubridate)
library(ggplot2)

# cze_core %>%
#   filter(!is.na(death)) %>% 
#   mutate(life_duration = interval((birth),(death))) %>%
#   mutate(as.period(life_duration)) %>%
#   mutate(as.integer(life_duration / dyears(1)))
# 

# cze_core %>% 
#   mutate(month_birth = month(birth, label = T))

ymd('1948-11-13')
ydm('19982111') 
ydm(19982111)

ymd_hms('19931211 04H 43m 32s')

ymd(20011149)

as_date(1998)
as_date(0)

french_revolution <- mdy_hm('jul 14st, 1789 12:34', tz = 'cet')
french_revolution
with_tz(french_revolution, tz = 'America/Bogota')
OlsonNames()
library(tidyverse)

d = data.frame(day = c(2,5,23,31), month = c(3,6,12,4), year = c(1996,1998,2003,1345))
d
d %>% 
  mutate(date = make_datetime(year, month, day))
  # mutate(day = NULL)

library(legislatoR)

cze_core <- get_core(legislature = "cze")
cze_core

interval(ymd('1789 12 03'),ydm(12341209))

cze_core %>%
  filter(!is.na(death)) %>%
  mutate(life_duration = interval(birth,death)) %>%
  # mutate(life_duration = life_duration %/% years(1)) %>%
  mutate(life_duration = floor(time_length(life_duration, unit = 'year'))) %>%
  pull(life_duration)

library(ggplot2)

now()
year(now())
day(now())
month(now(), label = T)
wday(now(), label = T)

cze_core %>% 
  mutate(day_birth = wday(birth, label = T)) %>% 
  filter(!is.na(day_birth)) %>% 
  ggplot(aes(x = day_birth)) +
  geom_bar(fill="black") +
  labs(x = 'Day of the week' , y = 'Freq', title = "Day of birth")

wday(ymd('1998-8-12'), label = T)

##EXERCISE

names <- c('Lucas','Peter','Santiago')
day <- c("21", "10", "30")
month <- c('03','05','10')
year <- c('1990','1991','1992')
birthdays_people <- data.frame(names, day, month, year)

# Task 1: calculate the age in days of each people.



birthdays_people %>% 
  mutate(birthday = make_datetime(year, month, day)) %>% 
  mutate(age_in_days = time_length(as.interval(birthday,now()), unit = 'day')) %>% 
  mutate(age_in_days = floor(age_in_days))

# Task 2: what is exact difference in age between Lucas and Santiago?




birthdays_people_dates <- birthdays_people %>% 
  mutate(date_time_birthday = make_datetime(year, month, day))

birthdays_people_dates


lucas_birth <- birthdays_people_dates[1,5]
santiago_birth <- birthdays_people_dates[3,5]
interval_both <- as.interval(lucas_birth, santiago_birth) 
as.period(interval_both)

