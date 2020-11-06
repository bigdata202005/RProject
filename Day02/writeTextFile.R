l3 = LETTERS[1:10]
l3
fac = sample(l3, 10, replace = F)
fac
df = data.frame(x = '한글', y = 1:10, fac = fac)
class(df)
df
? write.table
write.table(df, 'sample1.txt')
write.table(df, 'sample2.txt', fileEncoding = "utf8" )
write.table(df, 'sample3.txt', fileEncoding = "utf8", sep=',')
write.table(df, 'sample4.txt', fileEncoding = "utf8", sep="\t" )
