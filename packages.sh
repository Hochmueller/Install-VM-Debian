#!/bin/bash
# Adrian Remonda 2013

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

echo "### Installing basic stuff..."
sudo apt-get install -y software-properties-common #to get apt-add repository
sudo apt-get install -y build-essential autoconf  vim vim-gnome meld  git gitk git-email git-gui  tree > /dev/null

echo "### Installing ssh"
sudo apt-get install -y openssh-server > /dev/null

echo "### Installing versioning tools"
sudo apt-get install -y mercurial libapache2-svn subversion meld > /dev/null
sudo apt-get install -y p7zip-full zip unzip unrar p7zip xutils-dev > /dev/null

echo "### Installing vim"
sudo apt-get install -y vim vim-gnome exuberant-ctags unrar-free > /dev/null

echo "### Installing kernel stuff"
sudo apt-get install -y aptitude gparted colorgcc bison flex texinfo gnuplot gnuplot-x11 > /dev/null

echo "### Installing compiling tools..."
sudo apt-get install -y ncurses-dev  > /dev/null
sudo apt-get install -y libncurses5-dev > /dev/null

echo "### Installing misc tools..."
sudo apt-get install -y gparted minicom  > /dev/null
sudo apt-get install -y xarchiver  > /dev/null
sudo apt-get install -y xclip > /dev/null

echo "### Python"
sudo apt-get install -y python python-serial python3 python-setuptools python-gpgme
sudo apt-get install -y python-matplotlib


echo "### Installing x86 toolchain. Necesesary for xilinx tools and bb kernel"
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386

echo "kernel and eliux stuff"
sudo apt-get install device-tree-compiler lzma lzop u-boot-tools

#sudo apt-get install -y nemo    # mejor que nautilus porque tiene F3

#Para que abra el ternmial con nautilus
#sudo apt-get install -y nautilus-open-terminal

# guake, para abrir la consola con F12
sudo apt-get install -y guake

echo "###Installing QT"
echo "###  TODO test. Qt parece que lo instala alguien mas"
sudo apt-get install -y qt4-dev-tools qt5-default


# ma
apt-get install caja-open-terminal mate-extras