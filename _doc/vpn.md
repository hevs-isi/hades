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

* Install `openconnect`
  * On ubuntu (from 15.10 to at least 21.04): `sudo apt-get install openconnect`
* Connect the VPN using your AAI login: `sudo openconnect --juniper remote.hevs.ch`

