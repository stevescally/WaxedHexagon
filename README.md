# Overview

## Analysis Lab

As part of work related to analyzing honeypot related artifacts this project
outlines the iterations of each labratory build. Network diagrams as well as
ansible playbooks are provided to allow others to build their lab as well.
This ensures that rebuilds and consistancy can be maintained in a reproducable
manor.

# Getting Started

1. Add new bridge network in proxmox
  1. Name: vmbr1
  1. IPv4/CIDR: 172.16.1.0/24
  1. IPv6/CIDR: fd21:bc66:5393:1::/64 (see https://cd34.com/rfc4193/) 
  1. Comment: "Analysis Lab 1"
1. Build OpenBSD host in proxmox.(Will be firewall, dhcpd, and dns)
  1. 1GB memory
  1. 1 socket, 1 core
  1. 50G storage space
  1. (2) interfaces, em0(vmbr0), em1(vmbr1)
1.Add packages for python3, git, ansible: <br>
   ``pkg_add python3 ansible git``
1.Checkout the waxedhexagon repository on fw1 machine.<br>
    ``git clone https://github.com/stevescally/WaxedHexagon.git``
1.Updated the inventory to reflect your network settings.
1.Run the baseline_openbsd.yaml playbook.<br>
    ``ansible -i inventory playbooks/baseline_openbsd.yaml -k -u <user>``

## Resource

* http://www.threatlocus.com
