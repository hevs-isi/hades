---
layout: page
permalink: doc/start/
weight: 0
title: Getting started
---

This small HOWTO explains how to start using the hades cluster, if something
goes wrong, don't hesitate to contact the [staff](../../staff) or fill a bug
into the [issue tracker](https://github.com/hevs-isi/hades//issues).

* Install our [tools](../tools/).
* Ask the [staff](../../staff/) for an access.
	* It's recommended to [change your password](http://hades.hevs.ch/horizon/settings/password/).

## Resources
Creating a virtual machine will allocate (*reserve*) some real resources (CPU,
RAM and storage).

These reserved resources will be unavailable for the other users until the
virtual machine is **deleted** (an instance in the *shutdown* state will still
have it's resources reserved).

A virtual machine model (*flavor* in OpenStack vocabulary) is defined by a
certain amount of CPU, RAM and storage.

### CPU allocation
Storage and RAM allocation are dedicated to one virtual machine and can't be
shared. CPU allocation can be dedicated or shared depending on the type of
machine needed.

## *Flavor* types
There are 2 family of flavors, **shared** and **physical**.

* **shared** : should be used for code development or long running virutal
				machine where the compute power is not critical. Unused CPU time
				will be used by other shared virtual machines.
* **physical** : should be used when performance is needed. When a CPU is not
					used, it can't be used by another virtual machine. For
					flavors between 1 and 12 CPU, all cores will be allocated in
					the same CPU socket, maximizing performances. That kind
					of machine should be deleted when not in use.


### *Flavor* decoder
*Flavor* are named after this scheme ```TYPE-cpu-CPU-ram-RAM-disk-DISK_G``` where

* ```TYPE``` is the type of CPU
	* ```shared``` : virtual CPU, will be time-shared between users.
	* ```physical``` : real physical dedicated CPU cores, all on the same CPU socket for VM smaller than 12 CPU.
* ```CPU``` is the number of CPU cores.
* ```RAM``` is the quantity of RAM.
* ```DISK``` is the storage size.

Examples:

* ```physical-cpu-24-ram-64G-disk-40G``` A virtual machine with 24 physical CPU cores (split on 2 CPU sockets), 64 GigaByte RAM and 40 GigaByte storage.

## Images
Installing a working virtual machine can be time consuming, and deleting that
machine may look counter-productive. If your virtual machine contains a
re-usable setup, the [staff](../../staff/) can convert it to an image.

Once converted to an image, the machine can be deleted (freeing all used CPU and
RAM resources) and created again in a few clicks.

## Fair use
At the time of writing, we expect all users to use the resources fairly. All
users will benefit from the fair use of the others.
Here are some recommendations:

* Use **physical** flavors only when you **need** performance.
* Use a reasonable amount of CPU and RAM. Don't allocate 24 CPU if your
	algorithm only use 4 CPU.
* Delete your virtual machine when you don't use it anymore.


| Action | Screenshot |
| Go to [hades.hevs.ch](http://hades.hevs.ch) and log in.															| ![](../../images/doc/vm_creation/00.png) |
| Go to **Compute/Images**.																							| ![](../../images/doc/vm_creation/01.png) |
| Find the image of your choice, and click on the **Launch** button. <br /> **"ubuntu 18.04 1.0"** is the current base image configured for the cluster. Other images are created on demand. The [staff](../../staff/) can convert a virtual machine to an image.						| ![](../../images/doc/vm_creation/02.png) |
| Enter an **Instance name** and click **Flavor**. <br /> Please use a sensible image name, maybe containing your username.		| ![](../../images/doc/vm_creation/03.png) |
| Choose a **flavor** wisely (using the upper arrow ↑ right of the instance name). <br /> The flavors are dynamically loaded at this step and may take some time to appear. | ![](../../images/doc/vm_creation/04.png) |
| Then click **Lauch Instance**  | ![](../../images/doc/vm_creation/05.png) |
| Go to **Comute/Instances**  | ![](../../images/doc/vm_creation/06.png) |
| The instance is created (indicated by **Block device mapping** in the **task** column). <br /> This operation may take some time, usually less than 2 minutes. | ![](../../images/doc/vm_creation/07.png) |
| The instance is ready (indicated by **Running** in the **Power State** column). <br /><br /> You can now connect to your instance using the **ssh** link in the "IP Address" column, notice the **hadessh://** URL on the lower left corner. <br /><br /> The ssh connection should appear (warning you this host is unknown at this time). The default password is the same on all virtual machines, and can be asked to the [staff](../../staff) | ![](../../images/doc/vm_creation/08.png) |
| When you are done using your VM, it can be removed (forever) by going to the **Comute/Instances** page and choosing the **Delete Instance** command from the drop down menu. | ![](../../images/doc/vm_creation/09.png) |


:point_right: [hadesssh://VM_IP](hadesssh://VM_IP) and
[hadesvnc://VM_IP](hadesvnc://VM_IP) are handled by our [tools](../tools). They
should work in your browser and on your desktop. They can be used to create
handy shortcuts to your VMs.

On windows, the [hadesscp://VM_IP](hadesscp://VM_IP) URL scheme is handled by
our [tools](../tools). See also : [file transfer in detail](../file-transfer).
