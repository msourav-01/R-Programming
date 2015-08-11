pollutantmean <- function(directory, pollutant, id){
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
                        
                      if(!exists("df")){
                      df <- read.csv(filename, header=T)
                      }else if (exists("df")){
                        df_temp <- read.csv(filename,header=T)
                        df<-rbind(df,df_temp)
                        rm(df_temp)
                      }
                    }
  #mean(df[pollutant],na.rm=T)
  df
}
