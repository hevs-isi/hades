---
layout: page
permalink: doc/gui/
weight: 11
title: GUI access to the VMs
---
:exclamation: There is a graphical "console" integrated into the web interface, but non-US keyboard mapping are not working as expected, see this issue on [noVNC page](https://github.com/kanaka/noVNC/issues/21).
So this method can't be supported, and will probably be disabled in the future.

This page is about an **alternate** and manual configuration for accessing the Virtual machines. Please have a look at our [pacakged tools](../tools) before continuing.

## VNC versus X11 forwarding

|               | VNC           | X11 forwarding |
| ------------- | ------------- | -------------  |
| Display       | Full remote desktop  | Single application   |
| OpenGL        | -                    | possible |

## VNC

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

## X11 forwarding for Windows
1. Install our [tools](../tools)
2. Install [VcXsrv](https://sourceforge.net/projects/vcxsrv/files/latest/download?source=files)
3. Run VcXSrv
4. Conntect to your machine using the `hadesssh://` link.
5. Test using `xclock`

![xclock](../../images/doc/xclock.png)

## X11 Forwarding for Linux

Install our [tools](../tools), then `ssh-hades cluster@VM_IP_ADDRESS -X`.
Applications started from this ssh shell will be run remotely and will be
displayed locally.

If you don't need the remote shell : `ssh-hades cluster@VM_IP_ADDRESS -X command`

:bulb: `VM_IP_ADDRESS` can be found on the web interface : > Compute > Instance , in the "IP Address" column

