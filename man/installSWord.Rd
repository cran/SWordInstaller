\name{installSWord}
\alias{installSWord}
\title{Install SWord}
\description{
Installs RExcel, an Excel add-in connecting R and Excel on Windows,
by running a Windows installer progam creating its own uninstaller.
} 
\usage{installSWord(id="SWordInstaller")
}
\arguments{
 \item{id}{source identifier, should be left the default value}
}

\details{

This is an installer package for SWord. The current version of SWord is
automatically downloaded from the project site (\url{http://rcom.univie.ac.at/})
and installation is started.

SWord requires R, rscproxy, rcom and statconnDCOM.

It is possible to install (or update) SWord on a machine without
Internet access. To accomplish this, download the current version from
\url{http://rcom.univie.ac.at/},
transfer it to the machine without Internet access and run in on this machine.
Administrator privileges are needed to run this installer.
}
\keyword{utilities}

