# 코드 수행 시간 측정
Sys.Date()
Sys.time()
Sys.timezone()
# 인수로 전달된 값의 실행시간을 알려준다.
system.time(2**100)

sum_to_n <- function(n){
  sum <- 0
  for(i in 1:n){
    sum <- sum + i
  }
  return(sum)
}
sum_to_n(1000)
# 실행시간을 알려준다.
system.time(sum_to_n(10000))
system.time(sum_to_n(1000000))
system.time(sum_to_n(100000000))

# 변수 목록 보기
ls()
# 변수 지우기
rm("i")
ls()
# 변수 모두 지우기
rm(list=ls())
ls()

x <- matrix (1:(10000*10000) , ncol =10000)
View(x)
system.time(save(x, file="x.RData" ))
rm("x")
system.time(load(file="x.RData" ))



