# 엑셀 파일 불러오기(읽기), 엑셀 파일 내보내기(저장)
#1. 신버전
name = c("iPhone","iPad","Mac")
price = c(100,80,200)
item = data.frame(NAME=name, PRICE=price)
item
install.packages("xlsx")   
library(xlsx)
# R 에서 작업한 데이터 외부에 엑셀 파일로 저장하기
write.xlsx(item, "item.xlsx")
# 외부 엑셀 파일 R로 불러오기 
item2 = read.xlsx("item.xlsx", sheetIndex = 1)
item2
item3 = read.xlsx("item.xlsx", sheetIndex = 1, colIndex = 2:3)
item3

# 구버전
? write.xlsx2
write.xlsx2(item,"item.xls", sheetIndex = 1)
item4 = read.xlsx("item.xls", sheetIndex = 1)
item4
item5 = readxl::read_excel(path = 'item.xls', sheet = 1)
item5
