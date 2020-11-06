l3 = LETTERS[1:10]
l3
fac = sample(l3, 10, replace = F)
fac
df = data.frame(x = '한글', y = 1:10, fac = fac)
class(df)
df
# Debian Control File 형식의 파일에서 R 객체를 읽거나 씁니다 .
? write.dcf
write.dcf(df)
write.dcf(df, 'sample1.dcf')
write.dcf(df, 'sample2.dcf', encoding = "utf8")
