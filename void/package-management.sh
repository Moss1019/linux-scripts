# update package database
xbps-install -S

# upgrade all installed packages
xbps-install -u

# full system upgrade (sync + upgrade)
xbps-install -Su

# install a package/program e.g. vim
xbps-install vim

# reinstall a package
xbps-install -f vim

# remove a package, leaves dependencies
xbps-remove vim

# remove package and unused dependencies
xbps-remove -R vim

# remove package, dependencies, and config files
xbps-remove -Oo vim

# check for issues
xbps-pkgdb -a

# download package without installing
xbps-install -D vim

# clean package cache
xbps-install -C

# remove orphaned packages
xbps-remove -o

# get source code (use void-packages repo)
# Manual process - clone void-packages repo
# show details about a package
xbps-query -R vim

# show details if installed
xbps-query vim

# search for packages containing term
xbps-query -Rs term

# list all installed packages
xbps-query -l

# Options
# download only, no install
-D

# force operation
-f

# assume yes to all prompts
-y

# dry run (simulate)
-n

# verbose output
-v

# ignore repositories
-I

# remove recursively (with dependencies)
-R

# remove obsolete files
-o

# clean cache
-C

################################
# basic system maintenance script
sudo xbps-install -Su
sudo xbps-remove -o