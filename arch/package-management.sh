# update package database
pacman -Sy

# upgrade all installed packages
pacman -Su

# full system upgrade (database refresh + package upgrade)
pacman -Syu

# install a package/program e.g. vim
pacman -S vim

# reinstall a package, resetting it to default state
pacman -S vim --overwrite='*'

# remove a package, leaves dependencies
pacman -R vim

# remove a package and its unused dependencies
pacman -Rs vim

# remove package, dependencies, and config files
pacman -Rns vim

# check for file conflicts and dependency issues
pacman -Dk

# download package without installing (to cache)
pacman -Sw vim

# clean package cache (remove all cached packages)
pacman -Scc

# clean package cache (remove only uninstalled packages)
pacman -Sc

# remove orphaned packages (no longer required)
pacman -Rns $(pacman -Qtdq)

# get source code (requires ABS - Arch Build System)
abs; cp -r /var/abs/extra/vim ~/

# show details about a package
pacman -Si vim

# show details if installed
pacman -Qi vim

# search for packages containing term
pacman -Ss term

# list all installed packages
pacman -Q

# list explicitly installed packages
pacman -Qe


# Options
# download only, no install
-w

# ignore package during upgrade
--ignore=package

# assume yes to all prompts  
--noconfirm

# simulate operation, no system changes
-p (with -S) or --print (with -R)

# verbose output
-v

# quiet output (reduce verbosity)
-q

# force operation
--force

# ignore dependencies
-d

# include optional dependencies
--asdeps


################################
# basic system maintenance script
sudo pacman -Syu --noconfirm
sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null || true