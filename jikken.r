humidity<-read.table("arrange_humidity.csv",row.names=1,sep = ",",header = T,
                   stringsAsFactors = F,fileEncoding ="UTF-8")
temp<-read.table("NiigataKishou_temp.csv",row.names=1,sep = ",",header = T,
                 stringsAsFactors = F,fileEncoding ="UTF-8")
sunlight<-read.table("sunlight_hours.csv",row.names=1,sep = ",",header = T,
                     stringsAsFactors = F,fileEncoding ="UTF-8")
kishou<-matrix(nrow = 55,ncol = 3)
kishou[,1]<-humidity[,6]
kishou[,2]<-temp[,6]
kishou[,3]<-sunlight[,6]
#ライブラリの読込み
library(psych)
#日本語対策
par(family = "HiraKakuProN-W3")
#PCA
result<-prcomp(kishou,scale=T)
summary(result)
#結果を表示する
biplot(result)
#固有ベクトルを求める
vect<-eigen(cor(kishou))
vect$vectors
#１次元データをdateに入れる
date<-result$x[,1]
