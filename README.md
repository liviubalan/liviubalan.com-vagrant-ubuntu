# liviubalan.com-vagrant-ubuntu

Hello,

I'm [Liviu Balan](http://www.liviubalan.com/) and here are the Vagrant configuration and provision shell scripts for
[www.liviubalan.com](http://www.liviubalan.com/), based on Ubuntu Server.

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

## Installation

After the Requirements section is checked, open a [console](https://en.wikipedia.org/wiki/Command-line_interface) and
follow this steps:

1. Clone the GitHub project repository:

 ```bash
 git clone git@github.com:liviubalan/liviubalan.com-vagrant-ubuntu.git
 ```

2. Change the current directory to `liviubalan.com-vagrant-ubuntu`:

 ```bash
 cd liviubalan.com-vagrant-ubuntu/
 ```

3. Create and configure the VirtualBox guest machine (more info on
[Vagrant Install ubuntu-precise32 and ubuntu-trusty32 on Linux Mint/Ubuntu Desktop](http://www.liviubalan.com/vagrant-install-ubuntu-precise32-and-ubuntu-trusty32-on-linux-mintubuntu-desktop)):

 ```bash
 vagrant up --provider virtualbox
 ```

4. Edit your operating system [hosts file](https://en.wikipedia.org/wiki/Hosts_%28file%29) (more info on
[Ubuntu Linux hosts file](http://www.liviubalan.com/ubuntu-linux-hosts-file)):

 ```bash
 192.168.56.101 http.liviubalan.com www.http.liviubalan.com
 192.168.56.101 wp.liviubalan.com
 ```

5. Connect to the virtual machine using:

 ```bash
 vagrant ssh
 ```

## Shared Folders

In order to access files on your host machine from your guest virtual machine all you need to do is to access the
`share` directory located on the root of the project. Because this project is based on Vagrant, by default, all you
put inside of your project directory (the directory with the `Vagrantfile`) from the host machine, will be shared to
`/vagrant` directory from the guest virtual machine.

**Remember that if you set `LIV_TUT_NO_BEGIN_SHR_CLEAN=1` (the default value), the init provision shell script will
delete all the files inside the shared directory. This is done in order to avoid filesystem conflicts. Read the
comments inside `provision-shell/resources/var.sh` for more details.**

Thank you for cloning!  
Bye bye!
