---
layout: page
permalink: doc/gui/
weight: 11
title: GUI access to the VMs
---
:exclamation: There is a graphical "console" integrated into the web interface, but non-US keyboard mapping are not working as expected, see this issue on [noVNC page](https://github.com/kanaka/noVNC/issues/21).
So this method can't be supported, and will probably be disabled in the future.

This page is about an **alternate** and manual configuration for accessing the Virtual machines. Please have a look at our [pacakged tools](../tools) before continuing.

# VNC versus X11 forwarding

|               | VNC           | X11 forwarding |
| ------------- | ------------- | -------------  |
| Display       | Full remote desktop  | Single application   |
| OpenGL        | -                    | possible |

# VNC

First of all you need a working [ssh connection](../ssh/)

### On the VM
The required software is already installed and configured in recent images (starting with 2015.02). For older images it is possible to configure the VNC server using the following procedure:
1. Install `x11vnc` : `sudo apt-get install x11vnc`
2. Create the file `/etc/X11/Xsession.d/00_x11vnc` containing the following : `x11vnc -auth guess -listen localhost -rfbport 5900 -forever -alwaysshared &`
3. Restart lightdm : "sudo restart lightdm"

### On your machine :
1. Forward the VNC display to your machine : `ssh-hades cluster@VM_IP_ADDRESS -L 11234:localhost:5900 -N &`
2. Open the display with your favorite client : `vinagre localhost:11234`
:bulb: `VM_IP_ADDRESS` can be found on the web interface : > Compute > Instance , in the "IP Address" column

# X11 Forwarding

First of all you need a working [ssh connection](../ssh/)

### On your machine
`ssh-hades cluster@VM_IP_ADDRESS -X`, then you can start the application from the ssh shell and it will be
displayed locally.

If you don't need the remote shell : `ssh-hades cluster@VM_IP_ADDRESS -X command`
:bulb: `VM_IP_ADDRESS` can be found on the web interface : > Compute > Instance , in the "IP Address" column

# Step-by-step setup for windows <a name="windows"></a>
* Download and install cygwin (preferably 64 bit if your platform is compatible)
	* Install (at least) the following packages:
		* ssh
		* xinit
	* Add this line `db_home: windows` at the end of `c:\cygwin\etc\nsswitch.conf`
	* Run a cygwin shell and type `pwd`, the expected output is `/cygdrive/c/users/USERNAME`. If the output is `/cygdrive/c/SPB_DATA`,
	you MUST remove the HOME environment variable.
		* Open Control Panel > search for environment variables > edit > remove HOME
	* Add this line `alias ssh-hades="ssh -o \"ProxyCommand ssh sshfwd@hades.hevs.ch -W %h:%p\""` at the end of `c:\cygwin\etc\profile`
	* Add this line `export DISPLAY=:0.0` at the end of `c:\cygwin\etc\profile`
	* Download [vncviewer64.exe](http://tigervnc.bphinz.com/nightly/viewers/vncviewer64.exe) into `c:\cygwin\bin`

	* Setup [ssh connection](../ssh/).

