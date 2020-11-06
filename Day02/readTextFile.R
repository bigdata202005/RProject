# Path 확인 
WD <- getwd()
WD
if (!is.null(WD)) setwd(WD) # Path 변경 
WD

# Text File Read
blank1 = read.table(file = "blank1.txt",header = TRUE,sep = " ")
blank1
class(blank1)
str(blank1)

blank2 = read.table(file = "blank2.txt",header = F,sep = " ")
blank2
class(blank2)
str(blank2)


names(blank2)
names(blank2)=c('id','height','weight')
names(blank2)
blank2

comma1 = read.table(file ="comma1.txt", header = T, sep=",")
comma1
comma2 = read.table(file ="comma2.txt", header = F, sep=",")
comma2
names(comma2)
names(comma2)=c('id','height','weight')
names(comma2)
comma2

# separator: tab
# data <- read.table(file = “directory/filename.txt”, header = TRUE, sep = “”)
tab1 = read.table(file ="tab1.txt", header = T, sep="\t")
tab1
tab2 = read.table(file ="tab2.txt", header = F, sep="\t")
tab2




