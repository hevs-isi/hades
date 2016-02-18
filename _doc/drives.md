---
layout: page
permalink: doc/network-drives/
weight: 20
title: Network drives
---

HEI network drives are available from the VMs, and here is how to mount them.

# Required software
The required software is already installed in recent images (starting with 2015.02), for older images, the `cifs-utils` package
must be installed.
{% highlight shell %}
sudo apt-get install cifs-utils
{% endhighlight %}

# List of drives
A list of available drives is [here](https://sinf.hevs.ch/fr-fr/Ressources/R%C3%A9seau/Lecteurs-r%C3%A9seau)

# Mounting from the GUI
1. Open the file manager (`thunar`)
2. Type `smb://SERVER/SHARE` into the address bar
3. Provide your credentials
	* Username : Your AAI username.
	* Domain : WORKGROUP (or anything else not empty).
	* Password : Your AAI password.

![Detail of a real board featuring a QR code generated using qr2gerber](../../images/doc/thunar_network_drive.png)


# Mounting from command line
Example : Mounting `i:\` in `./toto`

	mkdir -p toto
	mount -t cifs -o username=username_goes_here //datahei.hevs.ch/hei toto

# Permanent mount
Example : mount `i:\` in `/mnt/i`

1. Create the mount destination
```
mkdir /mnt/i
```

2. Add this line to `/etc/fstab`:
```
	//datahei.hevs.ch/hei  /mnt/i  cifs  username=username_goes_here,password=*****,iocharset=utf8  0  0
```
