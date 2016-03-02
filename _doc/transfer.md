---
layout: page
permalink: doc/file-transfer/
weight: 20
title: File transfer
---

## From your windows machine
* Using our [tools](../tools), since version 2016-03-02, `hadesscp://` URLs can
be used to copy files using WinSCP.

## From/to your Linux machine

### From your linux machine
* Using our [tools](../tools)
{% highlight shell %}
scp-hades local_file cluster@VM_IP:
{% endhighlight %}
* Using the standard `scp`
{% highlight shell %}
scp -o 'ProxyCommand ssh sshfwd@hades.hevs.ch -W %h:%p' localfile cluster@VM_IP:
{% endhighlight %}

### To your linux machine
{% highlight shell %}
scp vmfile localuser@YOUR_IP:
{% endhighlight %}


## From a FTP/HTTP server
Virtual machines have access to the internet and files can be transfered directy, for intsance getting the hades logo using `wget`:
{% highlight shell %}
wget http://hevs-isi.github.io/hades/images/logo1.png
{% endhighlight %}

## From/to the HEI network
HEI network drives are available from the VMs, and here is how to mount them.

### Required software
The required software is already installed in recent images (starting with 2015.02), for older images, the `cifs-utils` package must be installed.
{% highlight shell %}
sudo apt-get install cifs-utils
{% endhighlight %}

### List of drives
The sinf provides a list of [available drives](https://sinf.hevs.ch/fr-fr/Ressources/R%C3%A9seau/Lecteurs-r%C3%A9seau).
Another way to obtain this this list is by using the `net use` command on a windows machine with the drives already connected.

#### Example
On my windows machine:

{% highlight plaintext %}
C:\Users\uadmin>net use
New connections will be remembered.


Status       Local     Remote                    Network

-------------------------------------------------------------------------------
             I:        \\VLEDATA\HEI             NetWare Services
             K:        \\VLEDATA\ADM             NetWare Services
             P:        \\VLEDATA\PCB             NetWare Services
             R:        \\VLEDATA\SHARE\PUBLIC    NetWare Services
             T:        \\VLEDATA\TOOLS           NetWare Services
             U:        \\VLHDATA\HOME\STAFF\MARC.PIGNAT
                                                NetWare Services
             V:        \\VLEDATA\HDL             NetWare Services
             Y:        \\LXECAD\DATA\COLL        NetWare Services
The command completed successfully.


C:\Users\uadmin>

{% endhighlight %}


So the `I:` drive is on the server `VLEDATA` in the share `HEI`, It's complete URL is therefore : `smb://VLEDATA/HEI`


### Mounting from the GUI
1. Open the file manager (`thunar`)
2. Type `smb://SERVER/SHARE` into the address bar
3. Provide your credentials
	* Username : Your AAI username.
	* Domain : WORKGROUP (or anything else not empty).
	* Password : Your AAI password.

![thunar credentials](../../images/doc/thunar_network_drive.png)

### Mounting from command line
Example : Mounting `I:\` in `./toto`

{% highlight shell %}
mkdir -p toto
sudo mount -t cifs -o username=username_goes_here //datahei.hevs.ch/hei toto
{% endhighlight %}

:exclamation: Don't include `smb:` in the server path

### Permanent mount
Example : mount `I:\` in `/mnt/i`

1. Create the mount destination
```
mkdir /mnt/i
```

2. Add this line to `/etc/fstab`:
```
	//datahei.hevs.ch/hei  /mnt/i  cifs  username=username_goes_here,password=*****,iocharset=utf8  0  0
```
:exclamation: Don't include `smb:` in the server path

