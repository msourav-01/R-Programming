complete<-function(directory,id){
            
  
  if(grep("specdata", directory) == 1) { 
            directory <- ("./specdata/") 
        } 
  
  all_files <- as.character( list.files(directory) ) 
  file_paths <- paste(directory, all_files, sep="") 
  comp <- data.frame(id=integer(),nobs=integer())
  
          for(i in id)
              {
                      count<-0
                     df <- read.csv(file_paths[i],header=T)  
                     for(j in 1:nrow(df))
                     {if( !(is.na(df[j,2])) && !(is.na(df[j,3])))
                          {count=count+1}
                     }
                  
                comp<-rbind(comp,c(i,count))
                #count
               # i
              }
  
  colnames(comp) <- c("ID","NBOS")
  comp

}
                                
complete("specdata",1:23)
s

quit
