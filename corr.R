corr <- function(directory, threshold = 0)
                  {
  if(grep("specdata", directory) == 1) { 
    directory <- ("./specdata/") 
  } 
  
  all_files <- as.character( list.files(directory) ) 
  file_paths <- paste(directory, all_files, sep="")
  
  comp <- data.frame(id=integer(),nobs=integer())
  t_met <- data.frame(stat=logical())
  #corrr <- "NULL"
  for(i in 1:332)
  {
    count<-0
    df <- read.csv(file_paths[i],header=T)  
    for(j in 1:nrow(df))
    {if( !(is.na(df[j,2])) && !(is.na(df[j,3])))
    {count=count+1}
    }
    if(count>threshold){
      t_met[i,1]<- T
      #corrr <- cbind(corrr,c(cor(df[,2],df[,3])))
    }else{
      t_met[i,1]<- F
    }
    comp<-rbind(comp,c(i,count))
    #count
    # i
  }
  comp<-cbind(comp,t_met)
  
  colnames(comp) <- c("ID","NBOS","T_MET")
  
  for(k in 1:332)
    {
    if (comp[k,3]==T)
    {
      df <- read.csv(file_paths[k],header=T)
      corr<-c(cor(df[,2],df[,3],use = "pairwise.complete.obs"))
      if(exists("corrr"))
      {corrr<-c(corrr,corr)}
      else{
        corrr<-corr
      }
    }
    
  }
  
  corrr
  
                  }

corr("specdata",1000)

?length
