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
french_revolution <- mdy_hm('jul 14st, 1789 12:34', tz = 'cet')
french_revolution
with_tz(french_revolution, tz = 'America/Bogota')

d = data.frame(day = c(2,5,23,31), month = c(3,6,12,4), year = c(1996,1998,2003,1345))
d
d %>% 
  select(year, month, day) %>% 
  mutate(date = make_datetime(year, month, day))

cze_core <- get_core(legislature = "cze")

cze_core %>%
  filter(!is.na(death)) %>%
  mutate(life_duration = interval((birth),(death))) %>%
  mutate(life_duration = life_duration %/% years(1)) %>% 
  pull(life_duration)

cze_core %>% 
  mutate(day_birth = wday(birth, label = T)) %>% 
  filter(!is.na(day_birth)) %>% 
  ggplot(aes(x = day_birth)) +
  geom_bar(fill="black") +
  labs(x = 'Day of the week' , y = 'Freq', title = "Day of birth")
