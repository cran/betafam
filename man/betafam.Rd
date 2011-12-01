\name{betafam}
\alias{betafam}
\title{Detecting rare variants for quantitative traits uing nuclear families}
\description{
To detecting rare variants for quantitative traits using nuclear families, the linear combination methods are proposed using the estimated regression coefficients from the multiple regression and regularized regression as the weights.}
\usage{
betafam(ped,group.threshold=-1,fix.group.index=NULL, fix.weight=NULL,mute.SMM=TRUE,trait=c("binary","qtl"),LC.test=c("LC.true","LC","sig.LC","LC.mreg","LC.lasso","LC.elasticnet"),sig.LC.cutoff=0.1,true.beta=NULL,ped2multifam=FALSE,useParInRegression=FALSE,trace=FALSE)
}

\arguments{  
\item{ped}{input data, has same format with PLINK but having column names. The PED file is a white-space (space or tab) delimited file: the first six columns are mandatory: 
     FID: Family ID;
     IID: Individual ID;
     FA: Paternal ID;
     MO: Maternal ID;
     SEX: Sex (1=male; 2=female; other=unknown);
     PHENO: Phenotype; 
Genotypes (column 7 onwards) should also be white-space delimited; they are coded as 0, 1 and 2, indicating the number of coding allele, and NA is for missing genotype. }
\item{group.threshold}{optional, indicates the minor allele frequency threshold that alleles will be grouped marker in the pre-group step before the linear combination test; default is -1, which means all markers are not grouped.}
\item{fix.group.index}{optional, indicates the fixed grouping index for each marker regardless of the group.threshold value. The length of this vector equals the number of markers. For example, if fix.group.index=c(1,1,2,2,2), the first two markers will be grouped and the last three will grouped together marker in the pre-group step. Default is NULL, which means no pre-group is to be done. } 
\item{fix.weight}{optional, indicates the fixed weight for each marker in the pre-group step. The length of this vector equals the number of markers. Default is NULL, which means the weight on each marker is automatically specified by 1/sqrt(q(1-q)), where q is the minor allele frequency. }
\item{mute.SMM }{indicates whether or not the multi-marker test, same as FBAT -m test, should be calculated; default is TRUE. }
\item{trait}{taking values as c("binary","qtl"),indicates the trait type, either binary ("binary") or quantitative ("qtl").}
\item{LC.test}{taking values as c("LC.true","LC","sig.LC","LC.mreg","LC.lasso","LC.elasticnet"), indicates which test should be included in the linear combination methods. See details in the reference paper.}
\item{sig.LC.cutoff}{indicates the pvalue threshold for grouping the markers with pvalue< sig.LC.cutoff in the sig.LC test; default is 0.}
\item{true.beta}{indicates the true beta values used as the weights in the linear combination methods for simulation use only. Alternatively, this could  be used as fixed weights given by the user.}
\item{ped2multifam}{indicates whether or not a pedigree could be separated into multiple nuclear families. Default is FALSE.}
\item{useParInRegression}{indicates whether or not parents will be used in the linear regression for estimating the weights. Default is FALSE.} 
\item{trace}{indicates whether or not the intermediate outcomes should be printed; default is FALSE.}  
}
\value{
\item{single.P}{ pvalues for the sigle marker tests.}          
 \item{minP}{ minimum pvalue for the sigle marker tests.}              
 \item{Z}{ test statistic Z=S-E(S).}                 
 \item{Z.stat}{ Z statistics for each marker or group.}            
 \item{Zk.var}{ variance calculating by parental genotypes.}            
 \item{allele.weight}{ frequency-determined weights.}     
 \item{group.index}{ group index used in the pre-group step.}       
 \item{Ngroup}{ number of groups in the pre-group step.}            
 \item{sigma}{ empirical variance matrix.}             
 \item{inv.sigma}{ inverse sigma.}         
 \item{SMM.stat}{multiple marker test statistic }          
 \item{SMM.pvalue}{pvalue on the multiple marker test.}        
 \item{why.SMM.na}{reason that the SMM test does not exist.}        
 \item{LC.beta}{estimated betas in the LC test based on the single marker regression.}           
 \item{LC.stat}{LC test statistic}           
 \item{LC.pvalue}{pvalue on the LC test}         
 \item{sig.LC.beta}{estimated betas in the sig.LC test.}           
 \item{sig.LC.stat}{sig.LC test statistic}           
 \item{sig.LC.pvalue}{pvalue on the sig.LC test}         
 \item{true.LC.beta}{estimated betas in the true.LC test.}           
 \item{true.LC.stat}{true.LC test statistic}           
 \item{true.LC.pvalue}{pvalue on the true.LC test}         
 \item{mreg.LC.beta}{estimated betas in the mreg.LC test.}           
 \item{mreg.LC.stat}{mreg.LC test statistic}           
 \item{mreg.LC.pvalue}{pvalue on the mreg.LC test}         
 \item{lasso.LC.beta}{estimated betas in the lasso.LC test.}           
 \item{lasso.LC.stat}{lasso.LC test statistic}           
 \item{lasso.LC.pvalue}{pvalue on the lasso.LC test}         
 \item{elasticnet.LC.beta}{estimated betas in the elasticnet.LC test.}           
 \item{elasticnet.LC.stat}{elasticnet.LC test statistic}           
 \item{elasticnet.LC.pvalue}{pvalue on the elasticnet.LC test}         
 \item{runtime}{runtime of this program.}           
 \item{fam.info}{nuclear families in the ped data.}    

}

 
\references{    

Guo W , Shugart YY, Detecting Rare Variants for Quantitative Traits Using Nuclear Families (manuscript). 
 
} 

\examples{
#example.ped<-read.table("example.ped",head=1,stringsAsFactors=F) 
#library(glmnet)
#test<-betafam(ped=example.ped,trace=TRUE)
#test$elasticnet.LC.pvalue 
}

\keyword{rare; family-based test}
 