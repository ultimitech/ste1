# #!/bin/bash
# # Adding Node.js repository
# curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# # Adding Yarn repository
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo add-apt-repository ppa:chris-lea/redis-server
# # Refresh our packages list with the new repositories
# sudo apt-get update
# # Install our dependencies for compiiling Ruby along with Node.js and Yarn
# sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools nodejs yarn -y
# git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
# git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
# exec $SHELL
# rbenv install 3.2.2
# rbenv global 3.2.2
# ruby -v
# # ruby 3.2.2
# # This installs the latest Bundler, currently 2.x.
# gem install bundler
# # For older apps that require Bundler 1.x, you can install it as well.
# gem install bundler -v 1.17.3
# # Test and make sure bundler is installed correctly, you should see a version number.
# bundle -v
# # Bundler version 2.0
# rbenv rehash



# Author: UltimIT Tech Solutions
# do this first thing
# sudo apt update && sudo apt upgrade -y


# harden box
# sudo apt install -y fail2ban
sudo apt install nodejs -y
# add yarn repo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo add-apt-repository ppa:chris-lea/redis-server no need cuz redis-server in ubuntu repo
sudo apt update
# install our deps for compiling ruby along with nodejs and yarn
sudo apt install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools nodejs yarn

# install ruby
git clone http://github.com/rbenv/rbenv ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone http://github.com/rbenv/ruby-build ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
git clone http://github.com/rbenv/rbenv-vars ~/.rbenv/plugins/rbenv-vars
# exec $SHELL
# echo x
rbenv install 3.2.2
rbenv global 3.2.2
ruby -v
# rbenv rehash
# rbenv local
# `rbenv install '3.2.2'`

# install bundler
gem install bundler
rbenv rehash
bundle -v

# install nginx and passenger # echo x;touch f
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger $(lsb_release -cs) main > /etc/apt/sources.list.d/passenger.list'
sudo apt update
sudo apt install -y nginx-extras libnginx-mod-http-passenger
if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf; fi
sudo ls /etc/nginx/conf.d/mod-http-passenger.conf
# sudoedit /etc/nginx/conf.d/mod-http-passenger.conf
# passenger_ruby /home/vagrant/.rbenv/shims/ruby;
sudo service nginx start;sudo systemctl start nginx
sudo rm /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/todproof
# cp in content from gorails site
sudo service nginx reload

# chap 4 create a db
sudo apt update
sudo apt install -y postgresql postgresql-contrib libpq-dev
# sudo su - postgres
# createuser --pwprompt vagrant
# createdb -O vagrant todproof
# exit

# chap 5 deploy code
