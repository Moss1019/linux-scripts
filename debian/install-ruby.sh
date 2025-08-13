#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install curl build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev git -y
curl https://mise.run | bash
echo "eval \"\$(~/.local/bin/mise activate bash)\"" >> ~/.bashrc
source ~/.bashrc
mise -v
mise use -g ruby@3
gem install rails
gem install railties
gem install bundler

echo "Checking environment..."
ruby -v 
rails -v