IHCanalysis<-function(){

response<-readline(prompt="Do you want to calculate threshold value?(y/n)")

if(isTRUE(response=="y")){
  print("*****Starting calculation of threshold value*****")
  IHCthreshold()}
if(isTRUE(response=="n")){
threshold<-as.numeric(readline(prompt="What is your threshold value?"))}


file_count<-readline(prompt="How many files do you want to analyse with this threshold?")

for(i in 1:file_count){

  File<-readline(prompt="Enter .csv filename (w/o etxn)#")
  filename<-paste(File,".csv",sep="")

  Data<-read.csv(filename, header=T)
  Background <-Data[nrow(Data)-2,2]

  noback=matrix(
  nrow=nrow(Data),
  ncol=3)
  #noback<-data[1:nrow(Data),]
  for(i in 1:(nrow(Data))){
    noback[i,1]<-Data[i,2]-Background}
  Max<-noback[nrow(noback)-1,1]
  Min<-noback[nrow(noback),1]
  for(i in 1:(nrow(noback)-3)){
    noback[i,2]<-(noback[i,1]-Min)/(Max-Min)
    if(noback[i,2]>threshold){noback[i,3]<-1}else{noback[i,3]<-0}}

  write.csv(noback,file=paste(File,"result",".csv",sep=""))

   }
return()   
}