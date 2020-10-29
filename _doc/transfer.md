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

## Using `rsync`
`rsync` can be used to transfer files both ways:
### From the VM
{% highlight shell %}
rsync -azv -e 'ssh -A -J sshfwd@hades.hevs.ch' cluster@VM_IP:file_on_the_vm local_file
{% endhighlight %}

### To the VM
{% highlight shell %}
rsync -azv -e 'ssh -A -J sshfwd@hades.hevs.ch' local_file cluster@VM_IP:file_on_the_vm
{% endhighlight %}

## From a FTP/HTTP server
Virtual machines have access to the internet and files can be transfered directy, for intsance getting the hades logo using `wget`:
{% highlight shell %}
wget http://hevs-isi.github.io/hades/images/logo1.png
{% endhighlight %}

## From/to the HEI network
HEI network drives are available from the VMs, and here is how to mount them.

### Required software
{% highlight shell %}
sudo apt-get install cifs-utils
{% endhighlight %}

### List of drives
The sinf provides a list of [available drives](https://sinf.hevs.ch/fr-fr/Ressources/R%C3%A9seau/Lecteurs-r%C3%A9seau).
Another way to obtain this this list is by using the `net use` command on a windows machine with the drives already connected.

### Mounting from command line
Example : Mounting `I:\` in `./toto`

{% highlight shell %}
mkdir -p toto
sudo mount -t cifs -o vers=2.0,iocharset=utf8,uid=$(id -u),gid=$(id -g),username=username_goes_here //datahei-i.hevs.ch/hei toto
{% endhighlight %}

:exclamation: Don't include `smb:` in the server path

Then unmount when you're done (since **deleting the mount point could delete the whole mounted drive**).
{% highlight shell %}
sudo umount toto
{% endhighlight %}

### Permanent mount (not recommended)
This method is not recommended, since **deleting the mount point could delete the whole mounted drive**.


Example : mount `I:\` in `/mnt/i`

1. Create the mount destination
```
mkdir /mnt/i
```

2. Add this line to `/etc/fstab`:
```
	//datahei.hevs.ch/hei  /mnt/i  cifs  vers=2.0,iocharset=utf8,uid=1000,gid=1000,username=username_goes_here,password=*****  0  0
```
:exclamation: Don't include `smb:` in the server path
