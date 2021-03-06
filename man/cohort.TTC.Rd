% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cohort.TTC.R
\name{cohort.TTC}
\alias{cohort.TTC}
\title{Cohort - Data Weighting and "TTC" Calculation}
\usage{
cohort.TTC(transCount, initCount)
}
\arguments{
\item{transCount}{transitions counts for each time-step}

\item{initCount}{start vector counts for each time-step}
}
\value{
\item{SAT}{\emph{Scaled Average Transitions} - compute a TTC transition matrix by first scaling and weighting the counts (start vector counts and transition counts) then calculate the transition matrices for each time-step, and finally averaging over all available time-steps. e.g., average January matrices, then February matrices or average Q1, then Q2 ...then obtain the average of the transition matrices}

\item{SAPT}{\emph{Scaled Average Periodic Transitions} - compute a TTC transition matrix by weighting the transition percentages for each time-step (calculate the transition matrices for each time-step then weigh the percentages, and finally averaging over all available time-steps. e.g., average January matrices, then February matrices or average Q1, then Q2 ...then obtain the average of the transition matrices}

\item{USAT}{\emph{Unscaled Average Transitions} - compute a TTC transition matrix by first obtaining unscaled transition matrices for each time-step then averaging over all available time-steps}

\item{ATMP}{\emph{averageTransMatByPeriod} - returns the weighted the transition percentages for each time-step (calculate the transition matrices for each time-step then weigh the percentages}

\item{ATP}{\emph{averageTransByPeriod} - returns the scaled transitions for each time-step}

\item{ACP}{\emph{averageCountByPeriod} - returns the scaled start vector counts for each time-step}
}
\description{
Calculate \emph{Through-the-Cycle} transition matrices using the \emph{cohort method} transitions.
}
\details{
Many credit risk models require a \emph{long-run average} (Through-the-Cycle) PD estimate. This has been
interpreted as meaning the data from multiple years should be combined and the method capable of supporting
some form of weighting of  samples.

The three methods of weighting considered for data generated via the cohort method are:
\enumerate{
	\item Scale the number of transitions and firm counts using the a single year count to preserve dynamics, then average transitions and firms counts separately
	\item Estimate the single-year quantities (estimate with transition matrices for each time-step), then average across years
	\item Average annual transition matrices
}
The Markov property allows for direct weighting as each time-step can be regarded as distinct(independence).
}
\examples{

\dontrun{

#Set parameters
startDate  <- "2000-01-01"
endDate    <- "2005-01-01"
method       <- "cohort"   
snapshots <- 4  
interval <-  .25
Example<-getPIT(data,startDate, endDate,method, snapshots, interval)

lstInit <- Example$lstInitVec[lapply(Example$lstInitVec,length)>0]
lstCnt <- Example$lstCntMat[lapply(Example$lstCntMat,length)>0]
ExampleTTC <- cohort.TTC(lstCnt,lstInit)
 
}
}
\author{
Abdoulaye (Ab) N'Diaye
}
