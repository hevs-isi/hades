---
layout: page
permalink: doc/vpn/
weight: 1
title: VPN
---

At this time and for security reasons, the cluster is only available from the local hevs network. Remote access is possible through the corporate VPN.




## Windows and OS X

For windows or OS X users, the documentation for connecting to the VPN is on the [sinf website](https://sinf.hevs.ch/fr-fr/Ressources/R%C3%A9seau/VPN).




## Linux

* Install the required software.
`sudo apt-get install openconnect`
* Connect the VPN using your AAI login.
`sudo openconnect --juniper remote.hevs.ch`
* When the connection is established, run the following command to fix routes:
`sudo route add -net 153.109.0.0 netmask 255.255.0.0 dev tun0`
