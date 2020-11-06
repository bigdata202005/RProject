#----------------------------------------------------------------------
# 리스트(List)
# 리스트는 다른언어에서 흔히 보는 해싱 또는 딕셔너리에 해당하며, 
# (키, 값) 형태의 데이터를 담는 연관 배열(associative array)이다.
#----------------------------------------------------------------------

# 리스트의 정의 : list(키=값, 키=값, ...) 형태로 데이터를 나열해 정의한다.
list1 = list(name='kimc', age=23, gender=T)

list1
list1$name
list1$age
list1$gender
ifelse(list1$gender,'M','F')
msg = sprintf('%s(%d세, %s)',list1$name, list1$age, ifelse(list1$gender,'M','F'))
msg

# 각 값이 반드시 스칼라일 필요는 없다. 
list2 = list(name='kimc', hobby = c("등산","독서","낚시"))
list2
list2$name
list2$hobby[1]
list2$hobby[c(1,3)]

# 리스트 안에 리스트를 중첩하는 것이 가능
list3 = list(name='kimc', h = list(hobby = c("등산","독서","낚시")))
list3
list3$h$hobby
list3$h$hobby[c(2,1,3)]

# 리스트내 데이터 접근
# 앞에서 본바와 같이 리스트를 출력해보면 ‘$ 키’ 형태로 각 키들이 나열된다. 
# 데이터는 ‘리스트변수명$키’와 같이 접근한다. 
# 또는 각 요소를 순서대로 ‘리스트변수[[인덱스]]’와 같이 접근할 수도 있다.
list3
list3$name
list3[[1]]

list3$h
list3[[2]]

list3$h$hobby
list3[[2]][[1]]

list3[[2]]$hobby
list3$h[[1]]

list3[[2]]$hobby[c(1,2)]
list3$h[[1]][c(1,2)]

# 주의할점은 값을 가져오기 위해서는 [[인덱스]] 의 형태로 적어야지 
# [인덱스]로 해서는 안된다는 점이다. 
# [인덱스]의 형태는 각 값이 아니라 (키, 값) 을 담고 있는 서브 리스트를 반환한다
value1 = list3[1]
value2 = list3[[1]]
class(value1)
class(value2)
value1
value1$name
value2

# List와 Vector의 차이점은 Vector는 한 가지 타입의 원소만 담을 수 있지만, 
# List는 어떤 타입이든 담을 수 있다는 것이다.
# List 만들기
list4 = list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
list4
names(list4)
# List에 이름 붙이기
names(list4) = LETTERS[5:10]
names(list4)
list4

# 리스트 원소 조작하기 (Manipulating)
list4[7] = "추가된 데이터"
list4
list4[7] = "수정된 데이터"
list4
names(list4)[7]
names(list4)[7] = 'K'
names(list4)[7]
list4

list4['L'] = "추가된 데이터2"
list4
list4['M'] = LETTERS
# 경고메시지(들): 
#   In list4["M"] = LETTERS :
#   number of items to replace is not a multiple of replacement length
list4$M
list4['M'] = list(alphabet = LETTERS)
list4$M
list4$M[4:8]

# 리스트 합치기 : c() 키워드를 통해 리스트를 합칠 수 있다. 
l1 = list(month.name)
l1
l2 = list(format(ISOdate(2000, 1:12, 1), "%B"))
l2
names(l1) = c("Eng")
names(l2) = c("Kor")
l1
l2
l3 = c(l1,l2)
l3
l3$eng
l3$kor
names(l3)
v4 = paste(l3$Eng, l3$Kor, sep = "=")
v4
str(v4)
class(v4)


# 리스트를 벡터로 변환하기
# List 상태에서는 벡터 상태에서 보다 조작의 자유도가 떨어진다. 
# 예를 들어 산술 연산을 한다거나 할 수 없다. 
# 다양한 조작을 위해 리스트를 벡터로 변환할 때는 unlist() 키워드를 이용하면 된다. 

v5 = unlist(l3)
is.list(l3)
is.vector(v5)
v5
v5[1:3]
v5[c("Eng1","Kor1")]


v1 = 1:12
v1
v2 = rep('월',12)
v2
v3 = paste0(v1,v2)
v3
length(v3)
class(v3)
v3[1:3]
v3[3]
