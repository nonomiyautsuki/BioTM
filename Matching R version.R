Cat_test_list[Cat_test_list$animal %in% Cat_compare$test,]



x=system('perl main.pl',input=c("C:/Users/Daniel Normal/Desktop/Wang stopword trans/Stopword.csv","C:/Users/Daniel Normal/Desktop/Wang stopword trans/haze 3140.txt") ,intern=TRUE)


> x=system('perl main.pl',input=c("C:/Users/Daniel Normal/Desktop/Wang stopword trans/Stopword.csv","C:/Users/Daniel Normal/Desktop/Wang stopword trans/teacher.txt") ,intern=TRUE)
> perltest<-
  + x
> as.matrix.data.frame(perltest,nrow=2)
Error in seq_len(p) : argument must be coercible to non-negative integer
In addition: Warning message:
  In seq_len(p) : first element used of 'length.out' argument
> as.matrix.data.frame(perltest,ncol=2)
Error in seq_len(p) : argument must be coercible to non-negative integer
In addition: Warning message:
  In seq_len(p) : first element used of 'length.out' argument
> as.matrix.data.frame(perltest,ncol=2)
Error in seq_len(p) : argument must be coercible to non-negative integer
In addition: Warning message:
  In seq_len(p) : first element used of 'length.out' argument
> matrix(perltest)
[,1]     
[1,] "drink,1"
[2,] "cat,1"  
[3,] "eat,2"  
[4,] "cake,2" 
[5,] "coke,1" 
> strsplit(perltest,split",")
Error: unexpected string constant in "strsplit(perltest,split",""
> strsplit(perltest,split",",)
Error: unexpected string constant in "strsplit(perltest,split",""
> strsplit(perltest,",")
[[1]]
[1] "drink" "1"    

[[2]]
[1] "cat" "1"  

[[3]]
[1] "eat" "2"  

[[4]]
[1] "cake" "2"   

[[5]]
[1] "coke" "1"   

> perltest<-x
> strsplit(perltest,",")
[[1]]
[1] "drink" "1"    

[[2]]
[1] "cat" "1"  

[[3]]
[1] "eat" "2"  

[[4]]
[1] "cake" "2"   

[[5]]
[1] "coke" "1"   

> x=system('perl main.pl',input=c("C:/Users/Daniel Normal/Desktop/Wang stopword trans/Stopword.csv","C:/Users/Daniel Normal/Desktop/Wang stopword trans/teacher.txt") ,intern=TRUE)
> perltest<-x
> strsplit(perltest,",")
[[1]]
[1] "cake"  "2"     "eat"   "2"     "cat"   "1"     "coke"  "1"     "drink" "1"    

> matrix(perltest)
[,1]                                
[1,] "cake,2,eat,2,cat,1,coke,1,drink,1,"
> matrix(perltest, nrow=2)
[,1]                                
[1,] "cake,2,eat,2,cat,1,coke,1,drink,1,"
[2,] "cake,2,eat,2,cat,1,coke,1,drink,1,"
> matrix(perltest, ncol=2)
[,1]                                 [,2]                                
[1,] "cake,2,eat,2,cat,1,coke,1,drink,1," "cake,2,eat,2,cat,1,coke,1,drink,1,"
> matrix(perltest, ncol=2)
[,1]                                 [,2]                                
[1,] "cake,2,eat,2,cat,1,coke,1,drink,1," "cake,2,eat,2,cat,1,coke,1,drink,1,"
> matrix(perltest, ncol=1)
[,1]                                
[1,] "cake,2,eat,2,cat,1,coke,1,drink,1,"
> matrix(perltest, ncol=1,nrow=2)
[,1]                                
[1,] "cake,2,eat,2,cat,1,coke,1,drink,1,"
[2,] "cake,2,eat,2,cat,1,coke,1,drink,1,"
> y=strsplit(perltest,",")
> matrix(y, ncol=2)
[,1]         [,2]        
[1,] Character,10 Character,10
> matrix(y, nrow=2)
[,1]        
[1,] Character,10
[2,] Character,10
> y=strsplit(perltest,",")
> matrix(y, nrow=2)
[,1]        
[1,] Character,10
[2,] Character,10
> matrix(y, nrow=2)
[,1]        
[1,] Character,10
[2,] Character,10
> matrixy, nrow = 1, ncol = 1, byrow = FALSE,
Error: unexpected ',' in "matrixy,"
>        dimnames = NULL)
Error: unexpected ')' in "       dimnames = NULL)"
> matrix(y, nrow=2,ncol=2)
[,1]         [,2]        
[1,] Character,10 Character,10
[2,] Character,10 Character,10
> matrix(string(y), nrow=2,ncol=2)
Error in matrix(string(y), nrow = 2, ncol = 2)


> matrix(y, ncol=2)
[,1]         [,2]        
[1,] Character,10 Character,10
> matrix(y, ncol=2,nrow=4)
[,1]         [,2]        
[1,] Character,10 Character,10
[2,] Character,10 Character,10
[3,] Character,10 Character,10
[4,] Character,10 Character,10
> a=matrix(y, ncol=2,nrow=4)[1,1]
> a
[[1]]
[1] "cake"  "2"     "eat"   "2"     "cat"   "1"     "coke"  "1"     "drink" "1"    

> a=matrix(y, ncol=2,nrow=4)[1,2]
> a=matrix(y, ncol=2,nrow=4)[1,2]
> a
[[1]]
[1] "cake"  "2"     "eat"   "2"     "cat"   "1"     "coke"  "1"     "drink" "1"    

> a=matrix(y, ncol=2,nrow=4)[1,2]
> y
[[1]]
[1] "cake"  "2"     "eat"   "2"     "cat"   "1"     "coke"  "1"     "drink" "1"    

> type(y)
Error: could not find function "type"
> class(y)
[1] "list"
> y[1]
[[1]]
[1] "cake"  "2"     "eat"   "2"     "cat"   "1"     "coke"  "1"     "drink" "1"    

> y[[1]]
[1] "cake"  "2"     "eat"   "2"     "cat"   "1"     "coke"  "1"     "drink" "1"    
> y[[1]][1]
[1] "cake"
> matrix(y[[1]], ncol=2,nrow=4)
[,1]   [,2]  
[1,] "cake" "cat" 
[2,] "2"    "1"   
[3,] "eat"  "coke"
[4,] "2"    "1"   
Warning message:
  In matrix(y[[1]], ncol = 2, nrow = 4) :
  data length [10] is not a sub-multiple or multiple of the number of rows [4]
> matrix(y[[1]], ncol=2,nrow=4,byrow=TRUE)
[,1]   [,2]
[1,] "cake" "2" 
[2,] "eat"  "2" 
[3,] "cat"  "1" 
[4,] "coke" "1" 
Warning message:
  In matrix(y[[1]], ncol = 2, nrow = 4, byrow = TRUE) :
  data length [10] is not a sub-multiple or multiple of the number of rows [4]: 
  could not find function "string"