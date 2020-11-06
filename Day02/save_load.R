x = 1:1000
y = 1000:2000
head(x)
head(y)
x
y
# 저장 
save(x,y, file = "xy.RData")

# 모든 데이터 지우기
rm(list=ls())

# 읽기
load(file = "xy.RData")
