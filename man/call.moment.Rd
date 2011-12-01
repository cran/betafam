\name{call.moment}
\alias{call.moment}
\title{Calculating the expectation and variance of the offspring's genotype conditional on parental genotypes.}
\description{
The expectation and variance are calculated with respect to parental genotypes at a single marker under the null distribution of parental random transmission using Mendel's laws.  
} 
\usage{
call.moment(father,mother)  
}

\arguments{  
\item{father}{indicates the father's genotype, coded as 0, 1 and 2.} 
\item{mother}{indicates the mother's genotype, coded as 0, 1 and 2.}  
}


\value{
\item{mean}{expecation of the offspring's genotype.}   
\item{var}{variance of the offspring's genotype.}   
}

 
\references{    

Guo W , Shugart YY, Detecting Rare Variants for Quantitative Traits Using Nuclear Families (manuscript). 
 
} 

\examples{ 
call.moment(1,1)
}
