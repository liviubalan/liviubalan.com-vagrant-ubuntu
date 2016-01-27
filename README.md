# liviubalan.com-vagrant-ubuntu
Vagrant configuration and provision shell scripts for [www.liviubalan.com](http://www.liviubalan.com/), based on
Ubuntu Server.

## Requirements
In order to run this project on your machine you have to install the following packages:
* [Git](https://git-scm.com/). Checkout
[Git install on Ubuntu Server](http://www.liviubalan.com/git-install-on-ubuntu-server) for more details.
* [VirtualBox](https://www.virtualbox.org/). Checkout
[Install VirtualBox on Linux Mint using CLI](http://www.liviubalan.com/install-virtualbox-on-linux-mint-using-cli)
for more details.
* [Vagrant](https://www.vagrantup.com/). Checkout
[Vagrant Install on Linux Mint/Ubuntu Desktop](http://www.liviubalan.com/vagrant-install-on-linux-mintubuntu-desktop)
for more details.

## Shared Folders
In order to access files on your host machine from your guest virtual machine all you need to do is to access the
"share" directory located on the root of the project. Because this project is based on Vagrant, by default, all you
put inside of your project directory (the directory with the Vagrantfile) from the host machine will be shared to
"/vagrant" directory from the guest virtual machine.
