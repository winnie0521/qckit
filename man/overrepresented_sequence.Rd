% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/overrepresented_sequence.R
\name{overrepresented_sequence}
\alias{overrepresented_sequence}
\title{Sort all sequences per read by count along with a density plot of all counts with top 5 repreated sequences marked}
\usage{
overrepresented_sequence(name)
}
\arguments{
\item{name}{the object that is the path to gzippped FASTQ file}
}
\value{
table of sequnces sortted by count

density plot of sequence length with top 5 marked by rugs, saved as PDF file
}
\description{
Sort all sequences per read by count along with a density plot of all counts with top 5 repreated sequences marked
}
