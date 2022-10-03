# Overview

[Ansible](https://www.ansible.com/resources/get-started) is used to configure
most aspects of the lab environment(s).  This allows for easy replication,
standardization as well as customization of an environment.

# Mode(s)

This is strictly my usage and thoughts of ansible for this lab environment.

A host playbook only has (2) states:

* Deploying (First time / re-install)
* Updating (Configuration change / software update)

I use this thought process to guide the use of files, templates, inventory and
playbooks.  [Ansible documentation](https://docs.ansible.com/) has numerous
ways to allow you to manage any system or service and with that flexibility
comes complexity and hierarchies.

## Inventory

The inventory file is used to organize systems and provide global and local
system variables. While this isn't the only way to do this, this environment is
not complex enough to require variables tied to a specific service. The
extended extraction from the inventory listing seems to create a split location
that has to be rembered/considered with a service compared to looking at the
host/group vars listed in a single file.  Additionaly the structure will be
flattened anyway to reflect the inventory file layout. As with all things this
is simply my exposure and way of organizational thinking.

## Playbooks

### Master Playbooks

As the inventory creates the host groupings and vars the playbooks create the
functionality. Ansible has the ability to create Master playbooks which I use
to create the logical ordering of execution.  This can apply to deployments,
upgrades, or decomissioning. Master playbooks will be prefaced with `mpb_` in
the playbook name. 

### Basic Playbook

Playbooks should perform a defined deployment or upgrade tasks. In my
experience it is better to have more playbooks that replicate existing tasks
verses complex logic utilizing ansible working knowledge. Its more so the
explicit over implicit understanding when reading through a playbook. Can this
lead to cruft, yes, but will coming back to a playbook after (3) months require
remembering multiple ansible feature tie-ins and functionality, no.

