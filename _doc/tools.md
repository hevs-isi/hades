---
layout: page
permalink: doc/tools/
weight: 1
title: Tools
---

Accessing the cluster and virtual machines on it requires some tools and configuration.

## For windows.
* Install the [tools](http://hades.hevs.ch/hades-tools-windows-2016-02-26.exe).
* Generate your ssh public key
	* run `PuttyGen` (a shortcut should be in the start menu)
		* Click generate and move the mouse as requested
		* Save the private key as in your `home/hades/sshfwd.ppk` (example : `c:\users\uadmin\hades\sshfwd.ppk`).
		* Copy the public key from the top text field and email it to hades at hevs dot ch
		:Exclamation: Please don't use the "Save public key", it saves the key in another format.

## For linux
* Install the [tools](http://hades.hevs.ch/hades-tools-2016-02-26.deb).
* Generate your ssh public key (only if you don't have one)
	* `file ~/.ssh/id_rsa.pub`
		* If the file exists, skip the creation.
	* ssh-keygen -t rsa
		* save the key as `~/.ssh/id_rsa`
	* email `~/.ssh/id_rsa.pub` to hades at hevs dot ch

Now you can click on hadesssh:// and hadesvnc:// links :smile: