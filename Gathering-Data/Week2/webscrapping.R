con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

#Alternative method
library(XML)
url = "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html = htmlTreeParse(url, useInternalNode=T)

xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@id='col-citedby']", xmlValue)


library(httr)
html2 = GET(url)
content2 = content(html2, as='text')
parsedHtml = htmlParse(content2, asText=TRUE)
xpathSApply(parsedHtml, '//title', xmlValue)

#No access
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")

#So let's get access1
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user", "passwd"))
pg2
names(pg2)


# Using handles can allow us to get authentication for a specific handle, which
# is then stored in a cookie for furhter use. 
google = handle("http://google.com")
pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google, path="search")
