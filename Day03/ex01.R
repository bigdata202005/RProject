# 시뮬레이션을 할 때 필수적으로 알아야 하는 내용 중에 하나가
# 바로 난수 생성(random sampling) 이다.
# 난수(random number)는 무작위로 추출된 숫자로,
# 난수를 생성한다는 것은  
# 어떤 범위 내에서 무작위로 숫자를 추출하는 것을 일컫는다.
# R에서는 다양한 방법으로 난수를 생성할 수 있다.
# 가장 대표적으로 많이 사용하는 함수는 sample( )이다.
? sample
# sample(x, size, replace = FALSE, prob = NULL)
x <- 1:12
# 전체를 무작위로 추출
sample(x)
sample(x)
# 6개를 무작위로 추출
sample(x, size = 6)
# 동일한 숫자도 추출
sample(x, size = 6, replace = T)
# 동일한 숫자는 추출하지 않음
sample(x, size = 6, replace = F)
# 로또 번호 추출
lotto = sort(sample(1:45,6,F))
lotto
# 10개 의 로또번호 추출
for(i in 1:10){
  lotto = sort(sample(1:45,6,F))
  print(lotto)
}
x = 1:10
x
s1 = sample(x[x >  8]) # length 2
s2 = sample(x[x >  9]) # oops -- length 10!
s3 = sample(x[x > 10]) # length 0
s1
s2
s3
length(s1)
length(s2)
length(s3)
class(s1)

