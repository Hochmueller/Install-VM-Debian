# Install-VM-Debian
small guide how to install and set up a virtual machine with Debian. (MCT lecture FH Joanneum AEE)

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
su -
adduser <user> sudo
reboot
```
some packages for guesst additions (the guesst additions are VM features, like shared clipboard and shared folder):

```sh
# sudo apt-get install gcc linux-headers-$(uname -r) git build-essential
```

Now insert the guesst additions CD:
Devices -> Insert Guest Additions CD image…
```sh
# su
# cd /media/cdrom
# sh ./VBoxLinuxAdditions.run 
# reboot
# sudo adduser xxxx vboxsf
```
Now you can add a shared folder. 
Devices -> Shared Folders -> Shared Folders Settings…

