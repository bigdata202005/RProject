# json라이브러리
install.packages("jsonlite")
library('jsonlite')
data = fromJSON('전국금연구역표준데이터.json')
data
class(data)
dfJson = data.frame(data$records)
dfJson
class(dfJson)
names(dfJson)
dfJson$금연구역명

exportJson=toJSON(head(dfJson))
exportJson
write(exportJson,file='export.json')
? write
