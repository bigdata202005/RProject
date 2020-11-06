A = c(1,2,3,4,5)
A
if( 7 %in% A){ # %in% A에 속해 있는지 확인하는 논리문
  print("TRUE")
} else{ 
  print("FALSE")
}
# 년도가 윤년/평년인지 판단하는 식!!!
year = 2020
if(year%%400==0 || year%%4==0 && year%%100!=0){
  print("윤년")
}else{
  print("평년")
}
n = -5
if(n>0){
  print("양수입니다.")
}else if(n<0){
  print("음수입니다.")
}else{
  print("0입니다.")
}
for(n1 in A){
  print(n1)  
}
print(n1) 

for(n1 in A){
  if(n1%%2==0)
    print("n1은 짝수")  
  else
    print("n1은 홀수")  
}
# function()을 이용하여 함수 만들기
Plus_One = function(x){
  y = x+1 
  return(y)
}
Plus_One(5)

Plus_One <- function(x){
  y <- x+1 
  return(y)
}
Plus_One(5)

install.packages("ggplot2") # ggplot2라는 패키지 설치
library(ggplot2) # ggplot2 패키지 부착



