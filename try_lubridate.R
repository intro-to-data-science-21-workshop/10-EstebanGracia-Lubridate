today()
now()

ymd('1234-12-13')
ydm('19982111') #always return year-month-day
ydm(19982111)
mdy('jan 23st, 1789', tz = 'cet') # optional time zone
mdy('jen 23st, 1789') #won't work

ymd_hms("2017-01-31 20:11:59") # add hours minutes and seconds 
mdy_hm("01/31/2017 08:01") # it works with every format

make_date(year = 1998, day = 12, month = 2) # transform to date (very useful 
                                            # when there are different column for y,d,m)

ymd(c("2010-10-10", "bananas"))

mdy("12/30/14")

datetime <- today()
year(datetime)
month(datetime, abbr = T)
month(datetime, label = T, abbr = F)
wday(datetime, label = T) # week day (start from Sunday = 1)
mday(datetime) # month's day, note: no label argument
yday(datetime) # year's day

update(datetime, hours = 299) # we are in the future

dweeks(3.2) # week in seconds, it works with year and day as well

tail(OlsonNames(),23)

# most useful function (for me at least)
d = data.frame(day = c(2,5,23,31), month = c(3,6,12,4), year = c(1996,1998,2003,1345))
d %>% 
  select(year, month, day) %>% 
  mutate(date = make_datetime(year, month, day))
 