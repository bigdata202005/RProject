comma1 = read.csv('comma1.csv')
comma1
names(comma1)
comma2 = read.csv('comma2.csv', header = F)
comma2
comma3 = read.csv2('comma1.csv')
comma3
names(comma3)
comma4 = read.csv2('comma2.csv', header = F)  # 1줄을 1컬럼으로
comma4
comma5 = read.csv2('comma3.csv', header = F) # 구분자 적용
comma5
comma6 = read.csv2('comma2.csv', header = F, sep = ",") # 구분자 적용
comma6

