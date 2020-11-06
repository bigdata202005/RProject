# excel
install.packages("readxl") # 설치할 때 패키지명에 쌍따음표가 필요하다
library(readxl)
# data <- readxl::read_excel(path = “directory/filename.xlsx”, sheet = “sheetName” or index, col_names = TRUE)
df1 = readxl::read_excel(path = 'sample1.xlsx')
df1
names(df1)

df2 = readxl::read_excel(path = 'sample1.xlsx', sheet = "sample1", col_names = T)
df2
names(df2)

df3 = readxl::read_excel(path = 'sample1.xlsx', sheet = 1, col_names = F)
df3
names(df3)

df4 = readxl::read_excel(path = 'sample1.xls')
df4
names(df4)

df5 = readxl::read_excel(path = 'sample1.xls', sheet = "sample1", col_names = T)
df5
names(df5)

df6 = readxl::read_excel(path = 'sample1.xls', sheet = 1, col_names = F)
df6
names(df6)

