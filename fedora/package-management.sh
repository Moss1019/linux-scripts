# update package metadata
dnf check-update

# upgrade all installed packages
dnf upgrade

# full system upgrade (same as upgrade in dnf)
dnf upgrade

# install a package/program e.g. vim
dnf install vim

# reinstall a package, resetting it to default state
dnf reinstall vim

# remove a package, leaves dependencies
dnf remove vim

# remove a package and its unused dependencies
dnf autoremove vim

# check for problems
dnf check

# download package without installing
dnf download vim

# clean package cache
dnf clean all

# remove orphaned packages
dnf autoremove

# get source code for a package
dnf download --source vim

# show details about a package
dnf info vim

# show details if installed
dnf list installed vim

# search for packages containing term
dnf search term

# list all installed packages
dnf list installed

# Options
# download only, no install
--downloadonly

# assume yes to all prompts
-y

# assume no to all prompts
--assumeno

# simulate operation, no changes
--setopt=tsflags=test

# verbose output
-v

# quiet output
-q

# ignore missing packages
--skip-broken

# install only required dependencies
--setopt=install_weak_deps=False

################################
# basic system maintenance script
sudo dnf upgrade -y
sudo dnf autoremove -y