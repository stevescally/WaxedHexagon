# Overview

[Ansible](https://www.ansible.com/resources/get-started) is used to configure
most aspects of the lab environment(s).  This allows for easy replication,
standardization as well as customization of an environment.

# Mode(s)

This is strictly my usage and thoughts of Ansible but a host system only has
(3) states:

* Deploying
* Updating / Upgrading
* Removal / Decom

I use this thought process to guide the use of files, templates, inventory and
playbooks.  [Ansible documentation](https://docs.ansible.com/) has nuumerous
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

I'm not particularly concerned with inter-playbook logic or a complex
arrangement of roles, tasks, and other layouts. If you are re-building a host,
virtual machine, or service then a deployment playbook should do all task
related to deployment for the first time. Otherwise you are upgrading an
existing service. 

There will be times where the upgrade changes how a deployment should happen.
These areas can be back ported to the deployment playbook. Since you have
performed the upgrade you know the tasks wiill work for future deployments. In
the event that it doesn't work you can reference the upgrade process changes to
determine the error. There will be tasks and code that is reused but we have
tools to search for blocks of code and edit multiple files at one. These aren't
3k line programs and the playbooks are performing only the required actions so
the process and execution is compartmentalized and mentally mappable. Arguably
if you don't understand how the service or system is being deployed then it
doesn't make sense why you would be making changes. 

How could you possibly understand both what needs to be changed and what it
will affect if you don't know how the current process works.

