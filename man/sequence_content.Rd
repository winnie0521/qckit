% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sequence_content.R
\name{sequence_content}
\alias{sequence_content}
\title{Extract nucleoctide sequence content per position from fastq file}
\usage{
sequence_content(name, content)
}
\arguments{
\item{name}{an object that is the path to zipped Fastq file}

\item{content}{an object of string type that specifies the content in question, "A","T","G","C","N"(either capital or lower case)}
}
\value{
the per position
}
\description{
Extract nucleoctide sequence content per position from fastq file
}
