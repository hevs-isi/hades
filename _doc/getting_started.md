---
layout: page
permalink: doc/start/
weight: 0
title: Getting started
---

This small HOWTO explains how to start using the hades cluster, if something
goes wrong, don't hesitate to contact the [staff](../../staff) or fill a bug
into the [issue tracker](https://github.com/hevs-isi/hades//issues).

1. Install our [tools](../tools/).
2. Ask the [staff](../../staff/) for an access.
	* It's recommended to change your password.
3. Test the setup

	| Action | Screenshot |
	| Go to [hades.hevs.ch](http://hades.hevs.ch) and log in.															| ![](../../images/doc/vm_creation/00.png) |
	| Go to **Compute/Images**.																							| ![](../../images/doc/vm_creation/01.png) |
	| Click on the **Public** tab, select **ubuntu server 1.01** then click on **Launch instance**.						| ![](../../images/doc/vm_creation/02.png) |
	| Enter an **Instance name** and click **Launch**. You will be redirected to the **Compute/Instances** page.		| ![](../../images/doc/vm_creation/03.png) |
	| Please wait a few seconds until the instance is created (indicated by **Spawning** in the **task** column).		| ![](../../images/doc/vm_creation/04.png) |
	| Click on the **ssh** link in the **IP Address** column, notice the **hadessh://** URL on the lower left corner.	| ![](../../images/doc/vm_creation/05.png) |
	| The ssh connection should appear (warning you this host is unknown at this time). The default password is the same on all virtual machines, and can be asked to the [staff](../../staff) | ![](../../images/doc/vm_creation/06.png) |

4. When you are done using your VM, it can be removed (forever) by going to the
**Comute/Instances** page and choosing the **Terminate Instance** command from
the drop down menu.


:point_right: [hadesssh://VM_IP](hadesssh://VM_IP) and
[hadesvnc://VM_IP](hadesvnc://VM_IP) are handled by our [tools](../tools). They
should work in your browser and on your desktop. They can be used to create
handy shortcuts to your VMs.

On windows, the [hadesscp://VM_IP](hadesscp://VM_IP) URL scheme is handled by
our [tools](../tools). See also : [file transfer in detail](../file-transfer).