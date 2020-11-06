# 문제 1: sample()을 활용해서 로또번호(1 ~ 45, 6개)를 추첨하여라.
list = c(1:45)
print(list)
for(i in c(1:10)){
  lotto = sample(list, 6)
  lotto = sort(lotto)
  print(lotto)
}

# 문제 2: 다음의 수열로 구성 된 벡터를 생성하시오.
# AV=(1,3,5,7,9,⋯,99)
# BV=(1,1,2,2,3,3,4,4,5,5)
AV = seq(1,99,2)
AV
BV = rep(c(1,2,3,4,5), c(2,2,2,2,2))
BV

# 문제 3: 다음과 같은 행렬을 생성하시오.
# M=[ 123  456  789]
# 만들어야되는 매트릭스는 3행 3열입니다.
M = matrix(
  data = c(1:9), 
  nrow = 3
)
M

# 문제 4 : funtion()을 사용하여 다음의 함수를 만드시오.
# Quadratic(x,y)=x2+y+10
Quadratic = function(x,y){
  return (x^2 + y + 10)
}
Quadratic(2,3)
Quadratic(3,2)

# 출력문
print('하하하하')
print('호호호호')
cat('하하하')
cat('호호호')
sprintf("%d, %f, %s", 11,3.14,'호호호')

# 문제 5: 구구단을 출력하시오
for(i in c(1:9)){
  print(paste(i,'단'))
  for(j in c(1:9)){
    # print (paste(i, "*", j, "=", i*j))
    print(sprintf("%d * %d = %d", i,j,i*j))
  }
}
for(i in c(1:9)){
  t = ""
  for(j in c(1:9)){
    t = paste(t, sprintf("%2d*%1d=%2d", j,i,i*j))
  }
  print(t)
}

