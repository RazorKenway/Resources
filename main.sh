#!/bin/bash
# Coded by Razor Kenway 
# Owner at SL Android (Sri Lanka)
# SL Android Project

r='\e[1;31m'
g='\e[1;32m'
y='\e[1;33m'
b='\e[1;34m'
p='\e[1;35m'
lb='\e[1;36m'

function welcome() {
    text1="  SL-Android"
    text2="  Tool By RAZOR KENWAY"

    for ((i=0; i<${#text2}; i++)); do
        echo -n "${text2:$i:1}"
        sleep 0.1
    done
    echo

    for ((i=0; i<${#text1}; i++)); do
        echo -n "${text1:$i:1}"
        sleep 0.1
    done
    echo
    echo
    sleep 1
}

function fix(){
	echo -e "$r\e[1m Fixing, Please wait! "
	echo
	sleep 1
	pkg update -y
	pkg upgrade -y
	pkg uninstall python -y
	pkg install binutils -y
	pkg install wget -y
	#package_name="python_${version}_${arch}.deb"
	dpkg -i $1python_3.11.6-1_$2.deb #dpkg -i python_3.9.7_i686.deb

	dpkg -i Resources/libffi_3.4.4-1/libffi_3.4.4-1_$2.deb
	dpkg -i Resources/ncurses_6.4.20231001-1/ncurses_6.4.20231001-1_$2.deb
	dpkg -i Resources/libxml2_2.11.5-2/libxml2_2.11.5-2_$2.deb
	dpkg -i Resources/zstd_1.5.5-1/zstd_1.5.5-1_$2.deb
	dpkg -i Resources/libllvm_17.0.4/libllvm_17.0.4_$2.deb
	dpkg -i Resources/libcompiler-rt/libcompiler-rt_$2.deb
	dpkg -i Resources/lld_17.0.4/lld_17.0.4_$2.deb
	dpkg -i Resources/llvm_17.0.4/llvm_17.0.4_$2.deb
	dpkg -i Resources/ndk-sysroot_26b/ndk-sysroot_26b_$2.deb
	dpkg -i Resources/clang_17.0.4/clang_17.0.4_$2.deb
	dpkg -i Resources/gdbm_1.23/gdbm_1.23_$2.deb
	dpkg -i Resources/resolv-conf_1.3/resolv-conf_1.3_$2.deb
	dpkg -i Resources/glib_2.78.1-1/glib_2.78.1-1_$2.deb
	dpkg -i Resources/libandroid-posix-semaphore/libandroid-posix-semaphore_$2.deb
	dpkg -i Resources/libsqlite_3.43.1/libsqlite_3.43.1_$2.deb
	dpkg -i Resources/make_4.4.1/make_4.4.1_$2.deb
	dpkg -i Resources/ncurses-ui-libs/ncurses-ui-libs_$2.deb
	dpkg -i Resources/pkg-config/pkg-config_$2.deb
	dpkg -i Resources/python-ensurepip-wheels_3.11.6-1_all.deb
	dpkg -i Resources/python-pip_23.3.1_all.deb

	pkg install figlet ruby git toilet cowsay -y
	gem install lolcat
	pip install requests binencrypt bs4 Cryptodo krishto aiohttp asyncio user_agent
	echo
	echo
	echo -e "$y\e[1m Fixing Successfully !"
	echo -e "$y\e[1m Please Restart Termux !"
}

function main() {
    welcome
    echo -e "$g\e[1m Detecting Python Version.. "
    python_version=$(python --version 2>&1 | cut -d " " -f 2)
    sleep 1

    if [ "$python_version" == "3.11.6" ]; then
        echo -e "$g\e[1m Your Python Version is Stable ! "
    else
		echo " Your Python version is $python_version"
		echo -e "$r\e[1m Your Python Version is unstable ! "
		echo
		echo -e "$y\e[1m [1] aarch64       [2] arm"
		echo -e "$y\e[1m [3] i686          [4] x86_64"
		echo
		echo -e "$g\e[1m What is Your CPU Architecture (use lscpu command): \c "
		read choice

		if [ "$choice" == "1" ]; then
			fix Resources/ aarch64
		elif [ "$choice" == "2" ]; then
			fix Resources/ arm
		elif [ "$choice" == "3" ]; then
			fix Resources/ i686	
		elif [ "$choice" == "4" ]; then
			fix Resources/ x86_64
		else
			echo -e "$r\e[1m Invalid Choice "
		fi
    fi
}

main



		#apt install ./python_3.9.7_i686.deb -y
		 
		# mkdir build
		# cd build
		# ar x ../python_3.9.7_i686.deb
		# tar Jvxf data.tar.xz
		# cp -R data/data/pl.sviete.dom/files/usr/* $PREFIX/
		# cd ..
		# rm -rf data
		# echo "export LD_LIBRARY_PATH=$PREFIX/lib" > .bashrc
		# source .bashrc
		# curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py

		#python get-pip.py
		#pip list
		#python --version
