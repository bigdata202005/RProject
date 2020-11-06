rm(list=ls())

# 큐(Queue) : 큐는 먼저 들어온 데이터를 먼저 처리하는데 사용하는 자료구조이다
# Enqueue: 줄의 맨 뒤에 데이터를 추가한다.
# Dequeue: 줄의 맨 앞에 있는 데이터를 가져온다. 가져온 데이터는 줄에서 빠진다.
# Size: 줄의 길이, 즉 자료구조내에 저장된 데이터의 수를 반환한다.
# 이들 세가지 함수를 지원하는 큐를 작성해보자.

# 큐 생성
q = c()
# 큐의 사이즈 지정 : 0
q_size = 0
# 큐에 데이터 넣기
enqueue = function(data) {
  q <<- c(q, data) # 데이터 추가(<<-를 이용하여 전역변수에 접근)
  q_size <<- q_size + 1 # 사이즈 증가
}
# 큐의 맨 앞의 데이터 얻기
dequeue = function () {
  first = q[1] # 첫번째 데이터
  q <<- q[-1] # 첫번쨰 데이터를 제외한 모두
  q_size <<- q_size - 1 # 사이즈 감소
  return(first) # 첫번째 값 리턴
}

size = function(){
  return(q_size)
}

enqueue(3)
enqueue(6)
enqueue(1)
enqueue(7)

print(size())
dequeue()
dequeue()
dequeue()
dequeue()
print(size())
# 전역변수를 사용했으므로
# 외부에서 접근가능
# 데이터의 무결성에 위배된다.
q = c(q, 5)
print(size())
q

# 이러한 문제를 막기위한 방법은 큐 코드 전체를 하나의 함수로 감추어 
# 모듈화 시키는 것이다.
queue = function(){
  # 큐 생성
  q = c()
  # 큐의 사이즈 지정 : 0
  q_size = 0
  # 큐에 데이터 넣기
  enqueue = function(data) {
    q <<- c(q, data) # 데이터 추가(<<-를 이용하여 전역변수에 접근)
    q_size <<- q_size + 1 # 사이즈 증가
  }
  # 큐의 맨 앞의 데이터 얻기
  dequeue = function () {
    first = q[1] # 첫번째 데이터
    q <<- q[-1] # 첫번쨰 데이터를 제외한 모두
    q_size <<- q_size - 1 # 사이즈 감소
    return(first) # 첫번째 값 리턴
  }
  
  size = function(){
    return(q_size)
  }
  
  return(list(enqueue=enqueue , dequeue=dequeue , size=size))
}
# 객체 선언
q = queue ()
q
q$enqueue(1)
q$enqueue(2)
q$enqueue(3)
q$enqueue(4)
q$size()
q$dequeue()
q$dequeue()
q$size()

q = c(q, 5)
print(size())
q

q$enqueue(3)
q$enqueue(4)
q$size()
q$dequeue()
q$dequeue()
q$size()


