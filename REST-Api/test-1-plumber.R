source("test-1-functions.R")

library(jsonlite)


#* @apiTitle Plumber Test Codes

#* Function Test-GET
#* @param s
#* @param e
#* @get /test-get
function(s, e) {
  x <- myfunc1(s, e)
  # x <- toJSON(x)
  return (x)
}


#* Function Test-POST
#* @param s
#* @param e
#* @post /test-post
function(s, e) {
  x <- myfunc1(s, e)
  x <- toJSON(x)
  return (x)
}



#* Function Test-POST-1: to/from JSON done explcityly by codes
#* curl -v "http://localhost:7778/test-post-json" --data 'input={"data":[{"s":2, "e":4}]}' 
#*
#* @post /test-post-json
function(input) {
  cat("\n\n#[test-post-json]\n")
  cat("\n $[test-post-json]input", str(input), "\n")

  inputData <- fromJSON(input)
  cat("\n $[test-post-json]inputData", str(inputData), "\n")

  output <- myfunc2(inputData$data)
  return (toJSON(output))
}


#* Function Test-POST-2: to/from JSON done implicityly by plumber
#* curl -v "http://localhost:7778/test-post-json2" --data '{"input":{"data":[{"s":2, "e":4}]}}' -H "content-type: application/json"
#*
#* @post /test-post-json2
function(input) {
  cat("\n\n#[test-post-json2]\n")
  cat("\n $[test-post-json2]input", str(input), "\n")
  
  output <- myfunc2(input$data)
  return (output)
}


#* Function Test-POST-3: to/from JSON done implicityly by plumber
#* curl -v "http://localhost:7778/test-post-json3" --data '{"data":[{"s":2, "e":4}]}' -H "content-type: application/json"
#*
#* @post /test-post-json3
function(data) {
  cat("\n\n#[test-post-json3]\n")
  cat("\n $[test-post-json3]data", str(data), "\n")
  
  output <- myfunc2(data)
  return (output)
}
