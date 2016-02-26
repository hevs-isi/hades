# Tools for windows
Will install all the software for accessing `hadesssh://` and `hadesvnc://`
URLs.

# Generating hades-tools-windows-YYYY-MM-DD.exe
* Install InnoSetup (tested with version 5.5.5 (u))
* Add the following files to input/
	* pageant.exe
	* plink.exe
	* kitty.exe renamed to putty.exe
	* puttygen.exe
	* vncviewer.exe
* Compile hades-tools.iss