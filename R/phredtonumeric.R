basic_stat <- function(name){
    nc <- ncolumn(name)
    conn <- dbConnect(RSQLite::SQLite(),"test_file.sqlite")

    score_mean <- rep(NA,nc)
    score_median<-rep(NA,nc)
    score_q01 <- rep(NA,nc)
    score_q10 <- rep(NA,nc)
    score_q25 <- rep(NA,nc)
    score_q75 <- rep(NA,nc)
    score_q90 <- rep(NA,nc)
    score_q99 <- rep(NA,nc)


  for (i in 1:nc){
    myquery_default <-"select V1 from scoreTableFull"
    myquery <- sub("V1",paste("V",i,sep=""),myquery_default)
    scoredata <- dbGetQuery(conn,myquery)
    asc.dat <-data.frame(list(chr=names(gtools::asc(unique(scoredata[,1]))),val=gtools::asc(unique(scoredata[,1]))))
    scorecycle <- merge(scoredata,asc.dat,by.x=sub("1",i,"V1"),by.y="chr",all.x=T)
    score_mean[i] = mean(scorecycle$val)-33
    score_median[i] = median(scorecycle$val)-33
    score_q01[i] <- quantile(scorecycle$val,0.01)-33
    score_q10[i] <- quantile(scorecycle$val,0.10)-33
    score_q25[i] <- quantile(scorecycle$val,0.25)-33
    score_q75[i] <- quantile(scorecycle$val,0.75)-33
    score_q90[i] <- quantile(scorecycle$val,0.90)-33
    score_q99[i] <- quantile(scorecycle$val,0.99)-33
  }
    basic_stat <- rbind(score_mean,score_median,score_q01,score_q10,score_q25,score_q75,score_q90,score_q99)
    colnames(basic_stat) <- seq(1,nc,1)
    return(basic_stat)
    RSQLite::dbDisconnect(conn)
}
