---
layout: page
permalink: doc/tools/
weight: 1
title: Tools
---

Accessing the cluster and virtual machines on it requires some tools and
configuration.

## For windows.
* Install cygwin
	* Download the installer [for 64 bit](https://cygwin.com/setup-x86_64.exe), [for 32 bit](https://cygwin.com/setup-x86.exe)
	* Run it.
		*	|	Action																			|	Screenshot	|
			| Welcome screen, **click next**													| ![cygwin setup 0](../../images/doc/cygwin/00.png) |
			| Source	 screen, **click next**													| ![cygwin setup 1](../../images/doc/cygwin/01.png) |
			| Destination screen, it is not really recommended to change it. **click next**		| ![cygwin setup 2](../../images/doc/cygwin/02.png) |
			| Temporary download directory, can be changed. **click next **						| ![cygwin setup 3](../../images/doc/cygwin/03.png) |
			| Setup your internet connection, probably OK. **click next **						| ![cygwin setup 4](../../images/doc/cygwin/04.png) |
			| Select a mirror near you. **click next**											| ![cygwin setup 5](../../images/doc/cygwin/05.png) |
			| Select at least the packages names `ssh` and `xinit`. To select a package click the :arrows_clockwise: on the same line as the package until it displays a version number. **click next**	| ![cygwin setup 6](../../images/doc/cygwin/06.png) |
			| The installer automatically suggests installing dependencies. **click next**		| ![cygwin setup 7](../../images/doc/cygwin/07.png) |
			| You probably don't want one more desktop icon. **click finish**					| ![cygwin setup 8](../../images/doc/cygwin/08.png) |
* Generate your ssh public key
	* Run the Cygwin terminal
		* Type `touch test-write-permission`.
		* :exclamation: If the response is `touch: cannot touch 'test-write-permission': Permission denied`,
		  you should remove the `HOME` environment variable and restart another cygwin terminal (on Windows 7 :
		  click Start > Control Panel > search box :  environment > Edit environment variables for your account).
		* Remove the test file : `rm test-write-permission`.
		* Test if there is already a ssh pulbic key : `cat .ssh/id_rsa.pub`.
		* If the file exists, you can skip the key creation.
		* Create the key using `ssh-keygen -t rsa`, accept the default location (`/cygdrive/c/Users/uadmin/.ssh/id_rsa`), and feel free to set or not to set a passphrase.
* Send your public key (`~/.ssh/id_rsa.pub`) to the [staff](../../staff/).

* Install the windows [helper](http://hades.hevs.ch/hades-tools-windows-2016-02-25.exe).

	* Please change your password.
* Go to [hades.hevs.ch](http://hades.hevs.ch) and create a VM.
	* Log in.
	* Go to Compute > Image, click on the "Public" button.
	*
* Access it through [ssh](../ssh/) or via a [graphical user interface](../gui/).
