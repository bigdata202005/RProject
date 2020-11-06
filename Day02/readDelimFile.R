df1 = read.delim('sample1.txt')
df1
df2 = read.delim('sample2.txt', fileEncoding = "utf8")
df2
df3 = read.delim('sample3.txt', fileEncoding = "utf8")
df3
names(df3)
df4 = read.delim('sample3.txt', fileEncoding = "utf8", sep = ",")
df4
names(df4)
