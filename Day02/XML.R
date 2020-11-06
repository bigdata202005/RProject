
install.packages("XML")
library('XML')
result = xmlParse(file = "test.xml")
result
rootnode = xmlRoot(result)
rootnode
rootnode[1]
rootnode[1][1]
result = xmlToDataFrame("test.xml")
result
