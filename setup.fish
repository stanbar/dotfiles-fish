# Uncomment to add swap file

# sudo fallocate -l 2G /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile
# sudo swapon -s
# sudo echo "/swapfile    none    swap    sw  0 0" >> /etc/fstab


# add packages
sudo apt-add-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt upgrade -y
sudo apt install -y git
sudo apt install -y wget
sudo apt install -y openssl
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections~
sudo apt install -y unzip
sudo apt install -y fish

chsh -s /usr/bin/fish
curl https://getmic.ro | bash
sudo mv micro /usr/bin/micro
sudo apt autoremove

# install dotfiles 

git clone https://github.com/stasbar/dotfiles-fish.git ~/dotfiles/fish
touch ~/dotfiles/fish/secrets.fish
echo 'source ~/dotfiles/fish/profile.fish' >> ~/.config/fish/config.fish
ln -s ~/dotfiles/fish/functions ~/.config/fish/functions


# download and install android sdk
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
sudo unzip sdk-tools-linux-4333796.zip
sudo mv tools android-sdk-linux
sudo chown -R stasbar1995:stasbar1995 android-sdk-linux/

sdkmanager --update
sdkmanager --install
sdkmanager --licenses

# add directories
mkdir ~/.keys
mkdir ~/projects 

# install keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase
