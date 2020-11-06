# 날짜는 데이터 분석에서 매우 중요한 자료 형태 가운데 하나입니다. 

# R에서 날짜와 시간을 나타내는 데 쓰이는 클래스는 세 다음의 세 가지이다.
# Date : 날짜를 나타낸다. 내부적으로 1970년 1월 1일 이후 경과된 일 수를 저장한다.
# POSIXct : 날짜-시간을 나타낸다. 내부적으로 1970년 1월 1일에서 경과된 초 수와 타임존을 저장한다.
# POSIXlt : 날짜-시간을 나타낸다. 내부적으로는 1900년에서 경과된 년수, 월, 일, 시간, 분, 초, 타임존 등을 리스트의 형태로 저장한다.

# Sys.Date() 는 오늘 날짜를 반환합니다. 
Sys.Date()
class(Sys.Date())
# "2020-10-08"

Sys.time()
class(Sys.time())
# "2020-10-08 16:09:40 KST"

# date() 는 현재 날짜와 시간을 반환합니다.
date()
class(date())
# "Thu Oct 08 16:12:42 2020"


# unclass는 날짜와 시간이 어떻게 저장되어 있는지를 보여준다. 
# print.default()를 써도 된다.
unclass(Sys.Date()) # 1970년 1월 1일 이후 경과된 일 수
print.default(Sys.Date())

unclass(Sys.time()) # 1970년 1월 1일에서 경과된 초 수
print.default(Sys.time())


# 다음 기호(symbols)를 사용하여 format( ) 함수와 함께 사용하여 날짜를 출력할 수 있습니다.
# 기호	의미
# %Y	  4자리 년
# %G	  4자리 년(아래 설명 참조)
# %m	  2자리 월
# %d	  2자리 (월 중) 일(01-31)
# %H	  2자리 시간(00-23)
# %M	  2자리 분(00-59)
# %S	  2자리 초(00-59)
# %j	  3자리 (년 중) 일(001-366)
# %V	  2자리 (년 중) 주(01-53)
# %u	  1자리 (주 중) 일(1-7, 1=월요일)

format(Sys.Date(), format="%Y-%b-%d")
format(Sys.Date(), format="%G-%m-%d")
format(Sys.time(), format="%Y-%b-%d %H:%M:%S")
format(Sys.time(), format="%y-%b-%d %H:%M:%S")

year = as.integer(format(Sys.Date(), format="%Y"))
year
month = as.integer(format(Sys.Date(), format="%b"))
month
date = as.integer(format(Sys.Date(), format="%d"))
date
hour = as.integer(format(Sys.time(), format="%H"))
hour
minute = as.integer(format(Sys.time(), format="%M"))
minute
second = as.integer(format(Sys.time(), format="%S"))
second

format(ISOdate(year,month,date, hour, minute, second), format="%Y년 %B %d일 %H시 %M분 %S초")
format(ISOdate(1,1:12,1), format="%B")
format(ISOdate(1,1:6,1), format="%B")
format(ISOdate(1,1:12,1), format="%b")
format(ISOdate(1,1:6,1), format="%b")

# %u : 일월화수목금토일 순서로 71234567
# %w : 일월화수목금토일 순서로 01234560
# %A : 수요일
# %a : 수
for (y in 2020:2027) {
  print(format(as.Date(paste0(y, '-01-01', sep='')), '%Y/%m/%d, u=%u w=%w A=%A a=%a'))
}

# 날짜형으로 만듬
birth_date = as.Date('1992-08-22')
birth_date
class(birth_date)
format(birth_date, format="%Y년 %B %d일")

today = Sys.Date()
class(today)

# 일수차이구하기
days = today - birth_date
days 
# Time difference of 10274 days



# 날짜 자료 변환 (Date Conversion)
# 문자에서 날짜로 (Character to Date)

# 문자 데이터를 날짜로 변환하려면 as.Date() 함수를 사용합니다. 
# 형식은 as.Date(x, “format”) 입니다. 
# 여기서 x는 문자 데이터이고 format은 적절한 형식을 입력합니다.

# convert date info in format 'mm/dd/yyyy'
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")
dates
# default format 은 yyyy-mm-dd 입니다.
mydates <- as.Date(c("2007-06-22", "2004-02-13"))
mydates
str(mydates)

# 날짜에서 문자로 (Date to Character)
# as.Character() 함수를 사용하여 날짜를 문자 데이터로 변환 할 수 있습니다.
# convert dates to character data
strDates <- as.character(dates)
strDates 
str(strDates)



install.packages("parsedate")
library(parsedate)
as.Date('20210102', format='%Y%m%d')
as.Date(parse_iso_8601('20210102'))
as.Date('2021-01-02', format='%Y-%m-%d'); 
as.Date(parse_iso_8601('2021-01-02'))
as.Date(parse_iso_8601('2020W536'))
as.Date(parse_iso_8601('2020-W53-6'))


library(magrittr)
as.Date('Jan 01 2020', format='%b %d %Y')
as.Date('January 01 2020', format='%B %d %Y')
# 로케일 얻기
Sys.getlocale("LC_ALL") %>% strsplit(";")
#로케일 변경
Sys.setlocale("LC_ALL", "English") %>% strsplit(";")
as.Date('Jan 01 2020', format='%b %d %Y')
as.Date('January 01 2020', format='%B %d %Y')
#로케일 변경
Sys.setlocale("LC_ALL", "Korean") %>% strsplit(";")

# ----------------------------------------------------------------------------------------
# lubridate 패키지를 주로 살펴볼 것인데, 이 패키지를 쓰면 R에서 날짜와 시간을 다룰 수 있다.
# ----------------------------------------------------------------------------------------
install.packages("lubridate")
library(lubridate)

mtoday = today()
class(mtoday)
mtoday

mnow = now()
class(mnow)
mnow
# 함수를 통한 날짜변환
ymd("2017-01-31")
mdy("January 31st, 2017")
dmy("31-Jan-2017")
# 숫자도됨
ymd(20170131)
ymd_hms("2017-01-31 20:11:59")
mdy_hm("01/31/2017 08:01")

ymd(20170131, tz = "UTC")

# 실습데이터
library(nycflights13)
library(tidyverse)

# 개별 구성요소에서 생성
flights

# 때로는 문자열이 아니라 데이트-타임형의 개별 구성요소들이 여러 열에 걸쳐 있는 경우가 
# 있을 것이다. flights 데이터에 있는 것이 그렇다.
flights %>% select(year, month, day, hour, minute)

# make_datetime을 이용한 날짜 만들기
# 입력으로 날짜/시간을 생성하려면 데이트형은 make_date() 를, 
# 데이트-타임형은 make_datetime() 를 쓰면 된다.
flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))

# 구성요소 가져오기
datetime <- ymd_hms("2016-07-08 12:34:56")
year(datetime)
month(datetime)
mday(datetime)
yday(datetime)
wday(datetime)

month(datetime, label = TRUE)
month(datetime, label = TRUE, abbr = F)
month(datetime, label = TRUE, abbr = T)

wday(datetime, label = TRUE)
wday(datetime, label = TRUE, abbr = F)
wday(datetime, label = TRUE, abbr = T)


