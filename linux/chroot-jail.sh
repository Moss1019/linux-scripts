#! /bin/bash

sudo mkdir -p /chroot/jail

sudo useradd username
sudo passwd username
# enter and confirm password

sudo mkdir -p /chroot/jail/home/username
sudo chown username:username /chroot/jail/home/username

# create standard directories
sudo mkdir -p /chroot/jail/{bin,lib,lib64,usr,etc,dev,tmp,var,proc,home}
sudo mkdir -p /chroot/jail/usr/{bin,lib,lib64}
sudo mkdir -p /chroot/jail/var/log

# copy basic configurations
sudo cp /etc/passwd /chroot/jail/etc/
sudo cp /etc/group /chroot/jail/etc/
sudo cp /etc/hosts /chroot/jail/etc/
sudo cp /etc/resolv.conf /chroot/jail/etc/

# create devices
sudo mknod /chroot/jail/dev/null c 1 3
sudo mknod /chroot/jail/dev/zero c 1 5
sudo mknod /chroot/jail/dev/random c 1 8
sudo mknod /chroot/jail/dev/urandom c 1 9
sudo chmod 666 /chroot/jail/dev/{null,zero,random,urandom}

# copy bash and linux untilities + libraries
copy() {
    local binary="$1"
    local jail_dir="/chroot/jail"

    binary_dir=$(dirname "$binary")
    [ -d "$jail_dir$binary_dir" ] || sudo mkdir -p "$jail_dir$binary_dir"

    # copy binary
    sudo cp "$binary" "$jail_dir$binary"

    # copy libraries with simlinks
    ldd "$binary" 2> /dev/null | grep "=>" | while read lib; do
        lib_path=$(echo $lib | awk '{print $3}')
        if [ -f "$lib_path" ]; then
            lib_dir="$jail_dir$(dirname "$lib_path")"
            sudo mkdir -p "$lib_dir"
            sudo cp "$lib_path" "$lib_dir"
        fi 
    done

    # copy libraries 
    ldd "$binary" 2> /dev/null | grep -v "=>" | grep "lib" | while read lib; do
        lib_path=$(echo $lib | awk '{print $1}')
        if [ -f "$lib_path" ]; then
            lib_dir="$jail_dir$(dirname "$lib_path")"
            sudo mkdir -p "$lib_dir"
            sudo cp "$lib_path" "$lib_dir"
        fi
    done
}
copy /bin/bash
copy /bin/ls
copy /bin/cat
copy /bin/cp
copy /bin/mv
copy /bin/rm
copy /bin/mkdir
copy /bin/pwd
copy /usr/bin/id
copy /usr/bin/whoami
copy /usr/bin/groups

# set proper permissions
sudo chown root:root /chroot/jail
sudo chmod 755 /chroot/jail
sudo chmod 755 /chroot/jail/{bin,lib,lib64,usr,etc,dev}
sudo chmod 1777 /chroot/jail/tmp

# add config to /etc/ssh/sshd_config

# for terminal only access
# Match User username
#     ChrootDirectory /chroot/jail

# for sftp access
# Match User username
#     ChrootDirectory /chroot/jail
#     ForceCommand internal-sftp
#     AllowTcpForwarding no
#     X11Forwarding no

# restart sshd
