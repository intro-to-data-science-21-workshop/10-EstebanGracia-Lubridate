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

duration(90, "minutes")

# most useful function (for me at least)
d = data.frame(day = c(2,5,23,31), month = c(3,6,12,4), year = c(1996,1998,2003,1345))
d
d %>% 
  select(year, month, day) %>% 
  mutate(date = make_datetime(year, month, day))

t <- as.POSIXlt(as.Date('1994-04-12'))
is.POSt

x <- ymd('1998 oct 23') 
hour(x) <- 5 # add the hour to our date!
second(x) <- 34
dst(x)


x <- as.Date("2009-09-02")
dst(x)
y <- as.POSIXct("2009-08-03")
day(x)
int_diff(c(x,y))
int <- interval(x,y)
int_length(int)
shift <- as.period(interval(as.Date('1998-01-04'), as.Date('1998-02-04'))) # as.period = as.duration
int_shift(int, shift)

difftime(now() + 5, now()) # time difference
difftime(as.Date('2021-10-31'), now()) # change unity of misure

x <- as_date("2009-09-02", tz = NULL)
is.POSIX(x)

is.POSIXt(as.Date("2009-08-03"))
is.POSIXt(as.POSIXct("2009-08-03"))

dseconds(x = 6) #duration object

x <- c("09-01-01", "09-01-02", "09-01-03", "09-01-2003")

parse_date_time(x, "ymd HM") # won't work
parse_date_time(x, c("ymd", "dmy"))

parse_date_time(x, "ymd HM", truncated = 3) # it works

parse_date_time(c("2016.2", "2016-04"), orders = "Yq")

date <- ymd("2010-03-03")
rollbackward(date) # last day of the preview moth
rollforward(date) # last day of the current moth


x <- ymd_hms("2009-08-03 12:01:59.23")
# floor, celain and round 
floor_date(x, "day")
floor_date(x, "season")
floor_date(x, "halfyear")
floor_date(x, "year")


