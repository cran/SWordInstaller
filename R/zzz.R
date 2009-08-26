# 
#  SWordInstaller : Install SWord (Use R from Microsoft Word)
#  Copyright (C) 2009 Thomas Baier
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
.onLoad <- function(lib, pkg)
{
  # check the registry for a SWord installation
  lv<-getOption("show.error.messages")
  options(show.error.messages = FALSE)
  rv<-try(readRegistry("Software\\statconn\\SWord",hive=c("HLM")))
  options(show.error.messages = lv)
  if((class(rv) == "try-error")
     || is.null(rv)) {
    InstallMessage()
  }
}
