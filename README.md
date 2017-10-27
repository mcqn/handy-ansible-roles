# handy-ansible-roles

A place to hold Ansible roles that have proved useful in more than one project

Generally for projects involving Raspberry Pi.  Use this entire repository as a template for building out an Ansible-based project.

## Steps:

1. Install [Ansible](https://www.ansible.com/get-started) on your computer
1. Install the latest [Raspbian lite image](https://www.raspberrypi.org/downloads/raspbian/) onto a micro-SD card
1. Create a file called `ssh` on the `/boot` partition of the SD card.  The contents don't matter, it's just to enable the SSH server.  E.g. on Ubuntu `touch /media/myusername/boot/ssh`
1. Boot the Raspberry Pi with the micro-SD card, while plugged into a network via Ethernet
1. Find out the IP address of the Raspberry Pi
 * Use nmap (eg: `nmap -p 22 192.168.0.* --open`), router or monitor to find IP address of Pi once booted.
1. Copy your SSH credentials onto the Pi
  ```ssh-copy-id pi@<ip-address-of-the-pi>```
1. Edit the ```hosts``` file so ansible knows which computer to configure.  Change the IP address in it to match the one you just found out.
1. Check you can run commands on the Pi using Ansible
   ```ansible controlled-pi -i hosts -a "hostname" -u pi```
1. Edit custom-install-steps.yml to set the roles that you want for this Pi, add any installation steps, etc. that you need to provision the Pi for the task you need it to do.
1. Update the Pi, using the playbook you customised in the last step, e.g.
   ```ansible-playbook custom-install-steps.yml -i hosts```

## Roles

These are some of the roles (sets of Ansible commands to fulfil a particular function) that you might want to use:

 * **base-nodered** Bare minimum Node RED installation, which runs automatically when the Pi is started up
 * **renamed-pi** Change the hostname of the Pi
