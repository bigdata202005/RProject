# 요인(Factor) : 요인(Factor)은 범주형(Categorical) 변수를 위한 데이터 타입이다. 
gender <- factor("m" , c("m" , "f" ))
gender
gender[1] = "m"
gender[2] = "m"
gender[4] = "f"
gender
gender[3] = "f"
gender
str(gender)
# factor는 vector형과 유사하다. 사실 데이터를 수정하지 않고 사용만 한다면 
# 그냥 둘은 동일하다고 봐도 무방할 정도이다.
# 하지만 실제로 사용해보면 팩터와 벡터는 어마어마한 차이가 있다.
# 바로 factor는 레벨을 가진다는 것이다. 레벨이 무슨말인지 모르겠다면 원소의 
# 도메인이 지정되어 있어 그 외의 값을 사용할 수 없다는 것이다.
# 기본적으로 팩터는 아래와 같이 선언하며 사용한다.

fact<-factor(c(1,2,3,4))
fact
str(fact)
print(fact)

# 보면 레벨이라는 것이 존재하는걸 확인할 수 있다.
# 레벨은 내가 지정해줄 수도 있지만 지정하지 않는다면 맨처음 초기화될때의 값을 기준으로 
# 레벨을 만든다.
# 따라서 fact변수의 레벨은 4이며 값으로는 1,2,3,4를 가진다.
# 이 레벨을 벗어나는 데이터를 넣으려고 하면 거부하며 에러를 내뱉는다.

fact[5]<-3
fact
fact[1]<-4
fact

fact[5]<-7
# 경고메시지(들): 
#   In `[<-.factor`(`*tmp*`, 5, value = 7) :
#   요인의 수준(factor level)이 올바르지 않아 NA가 생성되었습니다.
levels(fact)
#  levels속성에 1부터 10까지를 넣어주면 나중에 7을 추가할 수 있기 때문에 별 문제없이 사용
fact2<-factor(c(1,2,3,4),levels = seq(10))
levels(fact2)
fact2[5]<-7
fact2
# levels함수를 사용해서 레벨을 알아내서 거기에 값을 추가하고 다시 레벨로 넣는 것이다.
fact3<-factor(c(1,2,3,4))
levels(fact3)
levels(fact3)<-append(levels(fact3),7)
levels(fact3)
fact3[5]<-7
fact3

# vector와 factor의 전환
fact4<-factor(c(1,2,3,4))
vect1<-as.numeric(fact4)
fact4
vect1
str(fact4)
str(vect1)

