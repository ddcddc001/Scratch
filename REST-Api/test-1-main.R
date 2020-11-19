source('test-1-plumber.R')

library(plumber)

app <- pr("test-1-plumber.R")
# app <- plumb("test-1-plumber.R")
app$run(host = "0.0.0.0", port = 7778, swagger = FALSE)
