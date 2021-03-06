% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/copyToRepo.R
\name{copyLocalRepo}
\alias{copyGithubRepo}
\alias{copyLocalRepo}
\title{Copy an Existing Repository into Another Repository}
\usage{
copyLocalRepo(repoFrom = NULL, repoTo, md5hashes)

copyGithubRepo(repoTo, md5hashes, user = NULL, repo = NULL,
  branch = "master", repoDirGit = FALSE)
}
\arguments{
\item{repoFrom}{While copying local repository. A character that specifies
the directory of the Repository from which
artifacts will be copied. If it is set to \code{NULL} (by default),
it will use the \code{repoDir} specified in \link{setLocalRepo}.}

\item{repoTo}{A character that specifies the directory of the Repository into which
artifacts will be copied.}

\item{md5hashes}{A character vector containing \code{md5hashes} of artifacts to be copied.}

\item{user}{While coping the Github repository. A character containing a name
of the Github user on whose account the "\code{repoFrom}" - Repository is created.
By default set to \code{NULL} - see \code{Note}.}

\item{repo}{While coping the Github repository. A character containing a name of the
Github repository on which the "\code{repoFrom}" - Repository is archived.
By default set to \code{NULL} - see \code{Note}.}

\item{branch}{While coping with the Github repository. A character containing a name of 
Github Repository's branch on which the "\code{repoFrom}" - Repository is archived.
Default \code{branch} is \code{master}.}

\item{repoDirGit}{While working with the Github repository. A character containing a name of
a directory on the Github repository on which the "\code{repoFrom}" - Repository is stored.
If the Repository is stored in the main folder on the Github repository, this should be set 
to \code{FALSE} as default.}
}
\description{
\code{copy*Repo} copies artifacts from one \code{Repository} into another \code{Repository}.
It adds new files to existing \code{gallery} folder in \code{repoTo} \code{Repository}.
\code{copyLocalRepo} copies local \code{Repository} while \code{copyGithubRepo} copies
Github \code{Repository}.
}
\details{
Functions \code{copyLocalRepo} and \code{copyGithubRepo} copy artifacts from the
archivist's Repositories stored in a local folder or on the Github. 
Both of them use \code{md5hashes} of artifacts which are to be copied 
in \code{md5hashes} parameter. For more information about \code{md5hash} see \link{md5hash}.
}
\note{
If \code{repo} and \code{user} are set to \code{NULL} (as default) in Github mode then global parameters
set in \link{setGithubRepo} function are used. If one would like to copy whole Repository we suggest to 
extract all \code{md5hashes} in this way \code{unique(showLocalRepo(repoDir)[,1])}.
}
\examples{
\dontrun{


## Using archiviist Github Repository to copy artifacts
# creating example Repository
 
exampleRepoDir <- tempfile()
createEmptyRepo( exampleRepoDir )

# Searching for md5hashes of artifacts (without data related to them)
# in the archivist Github  Repository
hashes <- searchInGithubRepo( pattern="name", user="pbiecek", repo="archivist", fixed=FALSE )

# Copying selected artifacts from archivist Github  Repository into exampleRepoDir Repository

copyGithubRepo( repoTo = exampleRepoDir , md5hashes= hashes, user="pbiecek", repo="archivist" )

# See how the gallery folder in our exampleRepoDir Repository
# with copies of artifacts from archivist Github  Repository looks like
list.files( path = file.path( exampleRepoDir, "gallery" ) )

# See how the backpack database in our exampleRepoDir Repository looks like
showLocalRepo( repoDir = exampleRepoDir )

# removing an example Repository

deleteRepo( exampleRepoDir, deleteRoot=TRUE )

rm( exampleRepoDir )

# many archivist-like Repositories on one Github repository

dir <- paste0(getwd(), "/ex1")
createEmptyRepo( dir )
copyGithubRepo( repoTo = dir , md5hashes = "ff575c261c949d073b2895b05d1097c3",
                user="MarcinKosinski", repo="Museum",
                branch="master", repoDirGit="ex2")
                
# Check if the copied artifact is on our dir Repository

showLocalRepo( repoDir = dir) # It is in backpack database indeed
list.files( path = file.path( dir, "gallery" ) ) # it is also in gallery folder

# removing an example Repository
deleteRepo( dir, TRUE)

rm(dir)

## Using graphGallery Repository attached to the archivist package to copy artifacts

# creating example Repository

exampleRepoDir <- tempfile()
createEmptyRepo( exampleRepoDir )

# Searching for md5hashes of artifacts (without data related to them)
# in the graphGallery  Repository
archivistRepo <- system.file( "graphGallery", package = "archivist")
# You may use: 
# hashes <- unique(showLocalRepo(repoDir)[,1]) 
# to extract all artifacts from repository
hashes <- searchInLocalRepo( pattern="name",
                             repoDir =  archivistRepo,
                             fixed=FALSE )

# Copying selected artifacts from archivist Github  Repository into exampleRepoDir Repository

copyLocalRepo( repoFrom = archivistRepo, repoTo = exampleRepoDir , md5hashes= hashes )

# See how the backpack database in our exampleRepoDir Repository looks like
showLocalRepo( repoDir = exampleRepoDir )

# removing an example Repository

deleteRepo( exampleRepoDir, deleteRoot=TRUE )

rm( exampleRepoDir )
rm( archivistRepo )

}


}
\author{
Marcin Kosinski, \email{m.p.kosinski@gmail.com}
}
\seealso{
Other archivist: \code{\link{Repository}},
  \code{\link{Tags}}, \code{\link{\%a\%}},
  \code{\link{addTagsRepo}}, \code{\link{ahistory}},
  \code{\link{alink}}, \code{\link{aoptions}},
  \code{\link{archive}},
  \code{\link{archivist-github-integration}},
  \code{\link{archivist-package}}, \code{\link{aread}},
  \code{\link{asearch}}, \code{\link{cache}},
  \code{\link{cloneGithubRepo}},
  \code{\link{createEmptyRepo}}, \code{\link{deleteRepo}},
  \code{\link{getTagsLocal}},
  \code{\link{loadFromLocalRepo}}, \code{\link{md5hash}},
  \code{\link{rmFromRepo}}, \code{\link{saveToRepo}},
  \code{\link{searchInLocalRepo}},
  \code{\link{setLocalRepo}},
  \code{\link{shinySearchInLocalRepo}},
  \code{\link{showLocalRepo}},
  \code{\link{splitTagsLocal}},
  \code{\link{summaryLocalRepo}},
  \code{\link{zipLocalRepo}}
}

