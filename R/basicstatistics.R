#' create a data frame of mean, median and quatiles of the quality score per position
#' Write the basic statistics data frame to csv(current version)
#' Write the basic statistics data frame to a table in SQLite
#' @param name the object that is the path to the gzipped FASTQ file
#' @param writefile the boolean that asks whether to write the output as a txt file
#' @return basic statistics data frame
#' @return csv file and a SQLite table named




basic_stat <- function(nc,writefile=FAlSE){

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
    scorecycle <- dbGetQuery(conn,myquery)[,1]
    score_mean[i] = mean(scorecycle)
    score_median[i] = median(scorecycle)
    score_q01[i] <- quantile(scorecycle,0.01)
    score_q10[i] <- quantile(scorecycle,0.10)
    score_q25[i] <- quantile(scorecycle,0.25)
    score_q75[i] <- quantile(scorecycle,0.75)
    score_q90[i] <- quantile(scorecycle,0.90)
    score_q99[i] <- quantile(scorecycle,0.99)
  }
    basic_stat <- rbind(score_mean,score_median,score_q01,score_q10,score_q25,score_q75,score_q90,score_q99)
    colnames(basic_stat) <- seq(1,nc,1)
    if (writefile == TRUE) {write.csv(basic_stat,file = "basic_statistics.csv")}
    return(basic_stat)
    RSQLite::dbDisconnect(conn)
}
