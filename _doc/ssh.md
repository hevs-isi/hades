---
layout: page
permalink: doc/ssh/
weight: 10
title: Ssh access to VMs
---

VMs resides on their own private IP network, but can be accessed through `ssh`
using `hades.hevs.ch` as a gateway.

:exclamation: Configuring `putty` or `kitty` ssh clients for windows is somewhat complicated,
and using our prepackaged [windows tools](../tools#windows) is highly recommended. A package is
also available for debian-like Linux [here](../tools#windows).

## Manual setup using a standard ssh client
Tested using :
* openssh (the standard ssh client in most GNU/Linux distributions).
* cygwin's ssh

1. Send your public ssh key to the [staff](../../staff/).
	* The file usually resides in ~/.ssh/id_rsa.pub
	* If it does not exist, it can be generated using `ssh-keygen -t rsa`
2. Once your key has been added on the server, you can connect to your VM using
the following command: `ssh -o "ProxyCommand ssh sshfwd@hades.hevs.ch -W %h:%p" cluster@VM_IP_ADDRESS`
	* :bulb: `VM_IP_ADDRESS` can be found on the web interface : > Compute > Instance , in the "IP Address" column
3. Add your ssh public key to the VM `~/.ssh/authorized_keys`, so the VM won't ask the password anymore.

### TIP: Do it simpler
Do you want to use a simpler command, like `ssh-hades cluster@VM_IP_ADDRESS`?


Simply add this line to `~/.bashrc` : `alias ssh-hades="ssh -o \"ProxyCommand ssh sshfwd@hades.hevs.ch -W %h:%p\""` into your `~/.profile` file and
use the command.

