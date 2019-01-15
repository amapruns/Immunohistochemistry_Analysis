IHCthreshold<-function(){
file_count<-as.numeric(readline(prompt="How many files do you want to analyse?"))
max_min=matrix(
  nrow=file_count,
  ncol=3)
for(i in 1:file_count){
  File<-readline(prompt="Enter .csv filename (w/o etxn)#")
  filename<-paste(File,".csv",sep="")

  Data<-read.csv(filename, header=T)
  Background <-Data[nrow(Data)-2,2]
  max_min[i,1]<-Data[nrow(Data)-1,2]-Background
  max_min[i,2]<-Data[nrow(Data),2]-Background
  }
#print(max_min)
Max_min_avg<-array(colMeans(max_min))
#print(Max_min_avg)

for(i in 1:nrow(max_min)){
  max_min[i,3]<-(max_min[i,2]-Max_min_avg[2])/(Max_min_avg[1]-Max_min_avg[2])}

#print(max_min)

normalised_min<-max_min[,3]
Avg_normalised_min<-mean(normalised_min)
St1<-sd(normalised_min)#formula for calculating standard dev of sample
threshold<-Avg_normalised_min+2*St1

response<-readline(prompt="Want to save .csv file with maximas and minimas?(y/n)")

if(isTRUE(response=="y")){

outputfile<-readline(prompt="Enter .csv output file name ")
write.csv(max_min,file=paste(outputfile,".csv",sep=""))
}

print(paste("The threshold value is",threshold))
assign("threshold",threshold,.GlobalEnv)
return(threshold)
}