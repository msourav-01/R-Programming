pollutantmean <- function(directory, pollutant, id){
  a <- 0
  s<- 0
  for(i in id)
  { 
    if((floor(log10(i))+1) == 1) {
      filename <- paste("00",i,".csv", sep="")
      
    } else if((floor(log10(i))+1) == 2) {
      filename <- paste("0",i,".csv", sep="")
    }
    else if((floor(log10(i))+1) == 3) {
      filename <- paste(i,".csv", sep="") 
    }
    if(a == 0){
      
      df <- read.csv(filename, header=T)
      a=a+1
    } else if(a != 0){
      
      df_temp <- read.csv(filename, header=T)
      df <- rbind(df,df_temp)
    }
    
    s<-mean(df[,pollutant],na.rm=T)
    
    
    s
  }
}
