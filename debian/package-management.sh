# update package lists
apt update

# upgrade packages currently installed, according to package lists
apt upgrade

# upgrade the distro
apt full-upgrade
apt-get dist-upgrade

# install a package/program e.g. vim
apt install vim

# reinstall a package, resetting it to default state
apt reinstall vim

# remove a package or program, leaves config files
apt remove vim

# remove a package and any config files
apt purge vim

# update package cache and check for broken dependencies
apt check

# download the package binary
apt download vim

# clean the system, removing cached files
apt clean

# remove dependencies that are no longer required
apt autoremove

# get the source code for a package
apt-get source vim

# show details about a package, installation status and dependencies
apt show vim

# show details, but only if it is installed
apt list vim

# search for packages where the name contains the search term
apt search term

# change the source of a package
apt edit-sources vim

# Options
# download only, no install
-d

# compile source into binary
-b

# only install essential dependencies
--no-install-recommends

# install recommended packages
--install-suggests

# answer no to all prompts
--assume-no

# answer yes to all prompts
-y

# ignore packages missing from the repo
-m

# try to fix broken dependencies
-f

# simulate the opration, no system alteration
-s

# shopw detailed information about packages being modified
-V

# reduce the output
-q

# show percentage completed for each package being downloaded
--show-progress

# don't show the information about upgraded packages
--no-show-upgraded

# precvents the package upgrade if it's already installed
--no-upgrade

# upgrade the package only if it's installed
--only-upgrade

################################
# basic system maintenance script

sudo apt update
sudo apt upgrade -y
sudo apt autoremove
