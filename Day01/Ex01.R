# ctrl + enter : 커서가 놓인 해당 줄 실행
# ctrl + shift + enter  : 현재 스크립트창의 전체 코드가 실행
# 주석 처리하기 : ctrl + shift + c 
# ctrl + i  : 줄맞출 영역을 지정한 뒤에

# 1 ~ 10 까지 1씩 증가하는 수열 생성
x1 = c(1:10) 
x1_2 = seq(from = 1, to = 10,by = 1) 

# 1 ~ 10까지 2씩 증가하는 수열 생성
x2 = seq(from = 1, to = 10,by = 2) 
# 1을 10번 반복
y = rep(1,10) 

MATRIX_R = matrix(
  data = x1, 
  nrow = 5
)
print(MATRIX_R)
MATRIX_C = matrix(
  data = x1, 
  ncol = 5
)
print(MATRIX_C)

DATA_SET = data.frame(
  X1 = x1, # 변수명 = 벡터 값,
  X1_2 = x1_2,
  X2 = x2,
  y = y 
)

print(DATA_SET)
# 데이터 상단만
# 상단 6개 표시
print(head(DATA_SET)) 
# 상단 3개 표시
print(head(DATA_SET, 3))
# 데이터 하단만
print(tail(DATA_SET))
print(tail(DATA_SET, 4))

# 벡터에 속한 원소의 갯수
print(length(x1))
print(length(MATRIX_R))
print(length(DATA_SET))
# 행, 열
print(dim(x1))
print(dim(MATRIX_C))
print(dim(DATA_SET))

# ( ) : ()는 실행 함수(function)과 함께 쓰입니다. 
A=c(1,2,3,4,5) 
print(A)
# {} : 블록을 잡아준다.
for(i in A){
  print(i) # {} 안에 실행 함수를 삽입
}

# 이번에는 빈 공간을 가지는 벡터를 하나 만든 다음, 
# 빈 벡터에 값을 차례대로 삽입해보도록 하겠습니다.
B = c() # 빈 공간의 벡터 생성
for(k in seq(from = 1, to = 10, by = 1)){
  B = c(B,k)
}
print(B)

# [] : Index를 입력해야 될 때 쓰입니다. 
print(B[1]) # 1
print(B[2]) # 2 
print(B[0]) # numeric(0)
print(B[11]) # NA
print(B[-1]) # 값 제외
print(B[-3]) # 값 제외

print(B)   # 전체
print(B[])
# print(B[:])   # 에러
# print(B[3:])
print(B[1:3]) # 1 2 3
# 1,2,4,5번째 값
print(A[c(1,2,4,5)])
print(B[])


# 2차원 data.frame()형태의 경우
# 1행 전부
print(DATA_SET[1,]) # 1행 전부
print(DATA_SET[,1]) # 1열 전부
# 1,2,3 행 & 2열 빼고 나머지
print(DATA_SET[c(1,2,3),-2]) 



