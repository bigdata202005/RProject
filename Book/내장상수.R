# ----------------------------
# 내장상수(built-in constant)
# ----------------------------
LETTERS
letters
month.abb
month.name
pi

is.vector(LETTERS)
LETTERS[1:5]

is.vector(month.abb)
month.abb[1:5]

# ----------------------------
# locale 날짜
# ----------------------------
Sys.getlocale()

## months in your current locale
format(ISOdate(2020, 1:12, 1), "%B")
format(ISOdate(2020, 1:12, 1), "%b")
