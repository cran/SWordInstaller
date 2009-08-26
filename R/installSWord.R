# 
#  RCOM : COM Client and Server for R
#  Copyright (C) 2009 Thomas Baier, Erich Neuwirth
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; version 2 of the License.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# 
#  $Id: create.R 1.2 2003/04/27 16:38:37 baier Exp baier $
#
installSWord <- function(id = "SWordInstaller")  {
  lUtmac<-"UA-7876700-1";
  lUtmhn<-"rcom.univie.ac.at"
  lUtmhn<-runif(1,1000000000,9999999999)
  lCookie<-runif(1,10000000,99999999)
  lRand<-runif(1,1000000000,2147483647)
  lToday<-as.integer(Sys.time())
  lReferer<-"rcom"
  lUserVar<-""
  lUtmp<-paste(sep="","/downloads/SWord/",id)
  lUrl<-paste(sep="","http://www.google-analytics.com/__utm.gif?utmwv=1&utmn=",
	      lUtmhn,"&utmsr=-&utmsc=-&utmul=-&utmje=0&utmfl=-&utmdt=-&utmhn=",
	      lUtmhn,"&utmr=",lReferer,"&utmp=",lUtmp,"&utmac=",lUtmac,
	      "&utmcc=__utma%3D",lCookie,".",lRand,".",lToday,".",lToday,
	      ".",lToday,".2%3B%2B__utmb%3D",lCookie,"%3B%2B__utmc%3D",
	      lCookie,"%3B%2B__utmz%3D",lCookie,".",lToday,
	      ".2.2.utmccn%3D(direct)%7Cutmcsr%3D(direct)%7Cutmcmd%3D(none)%3B%2B__utmv%3D",
	    lCookie,".",lUserVar,"%3B");
  mySite<-"http://rcom.univie.ac.at"
  if (.Platform$OS.type != "windows")
		stop("SWord can only be installed on Windows!")
  installerFilename <- "SWord.latest.exe"
  mySitedir <- paste(mySite,"/download/current/",sep="")
  mytempdir <- tempdir()
  remoteFilename <- paste(mySitedir,installerFilename,sep="")
  localFilename <- paste(mytempdir,installerFilename,sep="\\")
  fileIsAvailable(lUrl);
  if (!fileIsAvailable(mySite)) {
     winDialog("ok",
       paste("The download site",mySite,
      "seems to be currently unreachable.",sep="\n"))
  } else if (!fileIsAvailable(remoteFilename)) {
     winDialog("ok",
       paste("The installer file",remoteFilename,
      "seems not to be available currently.",sep="\n"))
  } else {
  download.file(remoteFilename,localFilename,mode="wb")
  shell(localFilename)
  unlink(localFilename)
  }
}

backslashes<-function(instring){
   gsub("/","\\\\",instring)
  }

fileIsAvailable <- function(siteURL) {
  myURLConn <- try(eval(suppressWarnings(url(siteURL,open="r"))),silent=TRUE)
  if ("try-error" %in% class(myURLConn)) {
    result <- FALSE  
  } else {
  close(myURLConn)
  result <- TRUE }
  result
}



InstallMessage <- function() {
  message("You do not have a current version of SWord installed.")
  message("To install SWord type")
  message("     installSWord()")
  message("")
  message("This will download and install the current version of SWord")
  message("")
  message("You will need a working Internet connection")
  message("because installation needs to download a file.")   
}
