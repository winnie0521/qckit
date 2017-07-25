plot_quality_score <- function(name){


  StatBoxplotCustom <- ggplot2:::ggproto("StatBoxplotCustom", ggplot2::Stat,
                                         required_aes = c("x", "y"),
                                         non_missing_aes = "weight",

                                         setup_params = function(data, params) {
                                           params$width <- ggplot2:::"%||%"(
                                             params$width, (ggplot2:::resolution(data$x) * 0.75)
                                           )

                                           if (is.double(data$x) && !ggplot2:::has_groups(data) && any(data$x != data$x[1L])) {
                                             warning(
                                               "Continuous x aesthetic -- did you forget aes(group=...)?",
                                               call. = FALSE
                                             )
                                           }

                                           params
                                         },

                                         compute_group = function(data, scales, width = NULL, na.rm = FALSE, qs = c(.05, .25, 0.5, 0.75, 0.95)) {

                                           if (!is.null(data$weight)) {
                                             mod <- quantreg::rq(y ~ 1, weights = weight, data = data, tau = qs)
                                             stats <- as.numeric(stats::coef(mod))
                                           } else {
                                             stats <- as.numeric(stats::quantile(data$y, qs))
                                           }
                                           names(stats) <- c("ymin", "lower", "middle", "upper", "ymax")
                                           iqr <- diff(stats[c(2, 4)])

                                           outliers <- (data$y < stats[1]) | (data$y > stats[5])

                                           if (length(unique(data$x)) > 1)
                                             width <- diff(range(data$x)) * 0.9

                                           df <- as.data.frame(as.list(stats))
                                           df$outliers <- list(data$y[outliers])

                                           if (is.null(data$weight)) {
                                             n <- sum(!is.na(data$y))
                                           } else {
                                             # Sum up weights for non-NA positions of y and weight
                                             n <- sum(data$weight[!is.na(data$y) & !is.na(data$weight)])
                                           }

                                           df$notchupper <- df$middle + 1.58 * iqr / sqrt(n)
                                           df$notchlower <- df$middle - 1.58 * iqr / sqrt(n)

                                           df$x <- if (is.factor(data$x)) data$x[1] else mean(range(data$x))
                                           df$width <- width
                                           df$relvarwidth <- sqrt(n)
                                           df
                                         }
  )
  stat_boxplot_custom <- function(mapping = NULL, data = NULL,
                                  geom = "boxplot", position = "dodge",
                                  ...,
                                  qs = c(.05, .25, 0.5, 0.75, 0.95),
                                  na.rm = FALSE,
                                  show.legend = NA,
                                  inherit.aes = TRUE) {

    ggplot2::layer(
      data = data,
      mapping = mapping,
      stat = StatBoxplotCustom,
      geom = geom,
      position = position,
      show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = list(
        na.rm = na.rm,
        qs = qs,
        ...
      )
    )
  }



  #read the data ShortRead
  fastq <- ShortRead::readFastq(name)
  ## as a quality score matrix
  scorecycle<-as(Biostrings::quality(fastq), "matrix")
  scorecycle_df <- as.data.frame(scorecycle)
  colnames(scorecycle_df) = seq(1,ncol(scorecycle),1)
  #reshape the scorecycle for graphing

  score_melt<-reshape2::melt(scorecycle_df)
  labels <- seq(0, ncol(scorecycle), 10)
  p_quality_score <- ggplot2::ggplot(score_melt, ggplot2::aes(x =variable , y = value))+stat_boxplot_custom(qs = c(0.01, 0.25, 0.5, 0.75, 0.99))+ggplot2::labs(x = "Positions", y = "Quality Score",title = "Per base sequence quality")+ggplot2::scale_x_discrete(breaks=labels, labels=as.character(labels))
  return(p_quality_score)

}
