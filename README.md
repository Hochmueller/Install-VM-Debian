## Install Debian in Virtual Box & make connection to mircozed board (linux distribution of the lecture MIC FH Joanneum)

 - Install and open Oracle VM Virtual Box from https://www.virtualbox.org/
 - Download Debian from: http://ftp.heanet.ie/pub/debian/dists/jessie/main/installer-amd64/current/images/netboot/mini.iso
 - Click New in Oracle VM.
 - Name your new VM “debian” choose Type “Linux” and Version “Debian 64Bit”. Click Next.
 - Choose a memory size. Recommended half of the System memory. Click Next.
 - Hard Disk: Create a virtual Hard disk now. Click Create.
 - Hard disk file Type: VDI. Click Next
 - Storage on physical hard disk: Dynamically allocated. Click Next.
 - File location and size: Choose a path, on which the virtual hard disk gets placed. Choose a maximum size. At least 10GB. Click create.
 - In your Oracle VM Virtual Box Manager, you have now a VM added. On the right side, you can see the properties of your VM.
 - Click the start Button. 
 - A window “Select start-up disk” appears. Choose the Debian ISO downloaded bevor. Click Start
 - Press Install
 - Choose your Language, press Enter
 - Select your location and press Enter
 - Configure locales: United Kingdom. Press Enter
 - Configure the keyboard: Select your keyboard standard.
 - Configure the network: Default. Press Continue.
 - Domain Name: let empty. Press Continue.
 - Choose a mirror of the Debian archive: Country in which you are now. If Austria, choose ftp.tu-graz.ac.at
 - Proxy: let blank. Press Continue
 - Set up users and passwords: Root password: root, User Name: whateveryouwant, User name for your account: same as user, user password: whateveryouwant.
 - Partition disks: Guided – use entire disk.
 - Select disk to partition: Just one should be available. Choose it.
 - Partition disks: All files in one partition
 - Finish partitioning and write changes to disk
 - Partition disks: Yes
 - Configuring popularity-contest: make your own decision.
 - Software selection: Deselect “Debian desktop environment” by pressing space bar. Select MATE by pressing space bar. Press Enter.
 - Install the GRUB boot loader on a hard disk: Yes, /dev/sda (ata-…..)
 - Finish the installation: Continue
 - Debian installation appears again. Press Devices -> Optical Drives -> Remove disk from virtual drive
 - Press Machine -> Reset
 - Debian is starting.




Now to set up the debian system open the MATE Terminal:
Application -> System Tools -> MATE Terminal.
Execute the following instructions:
Add your user to the sudo group:

```sh
$ su -
# adduser <user> sudo
# reboot
```
some packages for guesst additions (the guesst additions are VM features, like shared clipboard and shared folder):

```sh
$ sudo apt-get install gcc linux-headers-$(uname -r) git build-essential
```

Now insert the guesst additions CD:
Devices -> Insert Guest Additions CD image…
```sh
$ su
# cd /media/cdrom
# sh ./VBoxLinuxAdditions.run 
# reboot
$ sudo adduser xxxx vboxsf
```
Now you can add a shared folder. 
Devices -> Shared Folders -> Shared Folders Settings…

Now install some basic packages:
```sh
$ . ./packages.sh
```


Install cross compiler. (armhf ARM hard floating point)

```sh
$ cd /etc/apt/sources.list.d/crosstools.list
$ su
# cat > crosstools.list
# deb http://emdebian.org/tools/debian/ jessie main
“press ctrl+D to save file”
# apt-get install curl
# exit
$ curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | sudo apt-key add –

$ sudo dpkg --add-architecture armhf
$ sudo apt-get update
$ sudo apt-get install crossbuild-essential-armhf

$ sudo apt-get install build-essential git debootstrap u-boot-tools device-tree-compiler

$ sudo dpkg --add-architecture i386
$ sudo apt-get update
$ sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386 
$ sudo apt-get install u-boot-tools
$ sudo apt-get install libssl-dev
```

# Connect to board

To connect the board to the computer, some settings have to get met. First of all, the network card setting on Windows have to get set as follow:

*	IP: 192.168.1.150 
*	Subnet mask:255.255.255.0

Also the network of the virtual machine have to get adjust. To make an internet connection on the micorzed board possible, a second network has to get included in the virtual box setting, and attached to Bridge adapter. This can be done in the following way: 

* Network -> adapter 2 -> bridge connection -> Name of your network card, which is connected to the board. 

To connect the adapter2 to the board, the network has to get configured as follow:

```sh
$ sudo echo -e "auto eth1\niface eth1 inet static\naddress 192.168.1.200\nnetmask 255.255.255.0\n" >> /etc/network/interfaces
```

The same has to be done on the board with the following settings:

```sh
# echo -e "auto eth0\niface eth0 inet static\naddress 192.168.1.200\nnetmask 255.255.255.0\ngateway 192.168.1.200 " >> /etc/network/interfaces
```

With this configuration, an internet connection on the microzed board can get established by executing the following commands as root. (Has to be done after every reboot of the virtual machine.)

```sh
$ su
# echo 1 > /proc/sys/net/ipv4/ip_forward
# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
# iptables -A FORWARD -i eth1 -j ACCEPT
```

To view the file system on the board the following command can be used:
```sh
$ caja "sftb://$192.168.1.120/root"
```
To apply a connection to the board, the following commands can be used:
```sh
$ ssh root@$192.168.1.120
```
