#!/bin/ksh
#
# Ansible Control Node Build
#
# For our analysis lab we need a certalized Ansible node
# which we will call, "the control node." This script aims
# to perform the inital setup as needed to accomplish this.
#
# Require user to become root to run this script. This is 
# needed as doas has not been setup yet.

# Check if current user is root
user_id=`/usr/bin/id -u `

if [ $user_id != 0 ]; then
     print "\n!!!Attention:!!!"
     print "****************************************************************************"
     print "This needs to run as the root user as privilege has not been configured yet."
     print "****************************************************************************\n"
     exit 192
fi

print "Checked if root user"
print "********************\n"


# Install other packages
# ansible, python3, zsh, vim (option 7), upgrade ansible collections

print "Installing additional packages:"
print "*******************************"

/usr/sbin/pkg_add ansible \
                  python3 \
		  zsh \
		  vim \
		  sudo 

# Install ansible-galaxy community general
# https://docs.ansible.com/ansible/latest/collections/community/general/index.html

print "\nInstalling Ansible-galaxy community.general collection"
print "******************************************************\n"

/usr/local/bin/ansible-galaxy collection \
                              install community.general \
                              -p /usr/share/ansible/collections 

# Setup sudoers file 
#
# Spent way too much time on getting doas to work in
# playbooks and sudo is the ansible default. Don't fight
# the current work with it.  I'll most likely look into
# getting this to work with doas

# Copy pre-modified sudoers file to /etc/sudoers

print "\nCopying modified sudoers file to /etc/sudoers"
/bin/cp -v ../al1/files/sudoers /etc/sudoers

