
myfunc1 <- function(s=1,e=10) {
  x <- seq(s,e)
  return (x)
}


myfunc2 <- function(data) {
  s <- data$s[1]
  e <- data$e[1]
  c1 <- seq(s, e)
  c2 <- seq(s+10, e+10)
  dfData <- data.frame(COL1=c1, COL2=c2)
    
  output <- list()
  output$data1 <- dfData
  output$data2 <- dfData
  return(output)
}
