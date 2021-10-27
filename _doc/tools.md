---
layout: page
permalink: doc/tools/
weight: 1
title: Tools
---

The virtual machines lives on their own private IP network, and accessing them
requires some tools and configuration. Our tools handles three special kind of URLs :

* `hadesssh://` for ssh.
* `hadesvnc://` for remote (VNC) display.
* `hadesscp://` for remote file transfer (scp).

:point_right: Virtual machines' IP addresses never change! Feel free to save links to your machines in your browser or on your desktop.



## For windows.
* Install the [tools for windows](http://hades.hevs.ch/hades-tools-windows-2021-10-27.exe).

* Generate your ssh public key
	* run `PuttyGen` (a shortcut should be in the start menu)
		* Click generate and move the mouse as requested
		* Save the private key as in your `home/hades/sshfwd.ppk` (example : `c:\users\uadmin\hades\sshfwd.ppk`).
		* Copy the public key from the top text field and email it to hades at hevs dot ch

## For Linux
We provide an installer for debian-likes.
It is always possible to use the [manual configuration](../ssh).

* Install the [tools](http://hades.hevs.ch/hades-tools-2021-10-27.deb).
* Generate your ssh public key (only if you don't have one)
	* `file ~/.ssh/id_rsa.pub`
		* If the file exists, skip the creation.
	* ssh-keygen -t rsa
		* save the key as `~/.ssh/id_rsa`
	* email `~/.ssh/id_rsa.pub` to hades at hevs dot ch

Now you can either use the `hadesssh://VM_IP` URL for accessing your VM
or the `ssh-hades cluster@VM_IP` command line tool.
The `hadesscp://` protocol is currently not supported on linux, the `scp-hades`
command should be used instead.
