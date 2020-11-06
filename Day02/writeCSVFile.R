l3 = LETTERS[1:10]
l3
fac = sample(l3, 10, replace = F)
fac
df = data.frame(x = '한글', y = 1:10, fac = fac)
class(df)
df
? write.csv
write.csv(df, 'sample1.csv')
write.csv(df, 'sample2.csv', fileEncoding = "utf8" )
# 'sep'로 설정하고자 하는 시도가 무시되었습니다
write.csv(df, 'sample3.csv', fileEncoding = "utf8", sep=',')
write.csv(df, 'sample4.csv', fileEncoding = "utf8", sep="\t" )
# 'sep'로 설정하고자 하는 시도가 무시되었습니다
# 기본 구분자 : ;
write.csv2(df, 'sample5.csv')
write.csv2(df, 'sample6.csv', fileEncoding = "utf8", sep="," )
write.csv2(df, 'sample7.csv', fileEncoding = "utf8", sep="\t" )
