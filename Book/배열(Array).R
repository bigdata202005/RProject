# 배열 정의
# matrix가 2차원 행렬이라면 배열(array)은 n차원 행렬이다. 
m1 = matrix(1:15, nrow = 5)
dim(m1)
m1
ar1 = array (1:15 , dim=c(5, 3))
dim(ar1)
ar1
# array 전치 : aperm
ar2 = aperm(array(1:15 , dim=c(5, 3)))
dim(ar2)
ar2
# byrow!!!!
ar3 = aperm(array(1:15 , dim=c(3, 5)))
dim(ar3)
ar3

#                dim =c(row, col, page)
ar4 = array(1:24 , dim=c(2,3,4))
dim(ar4)  # 4 3 2 : row, col, page
ar4

ar5 = array(1:24 , dim=c(4,3,2))
dim(ar5)  
ar5

ar6 = array(data     = 1:24,
            dim      = c(2,3,4),
            dimnames = list(c("row1", "row2"),
                            c("col1", "col2", "col3"),
                            c("page1","page2", "page3", "page4")))

ar6

# 배열 데이터 접근
# 행렬의 경우와 유사한 방식으로 각 요소에 접근할 수 있다. 
# 또, 배열의 차원은 dim() 함수를 통해 알 수 있다.
length(ar6)
dim(ar6)  
ar6
ar6[,,1] 
ar6[,1,] 
ar6[1,,] 
ar6[1,1,1]
ar6[,,1:2]
ar6[,2:3,1:2]
ar6[1,2:3,1:2]
ar6['row1','col1','page1']
ar6[,,'page1']



