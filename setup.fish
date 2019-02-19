# Uncomment to add swap file

# sudo fallocate -l 2G /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile
# sudo swapon -s
# sudo echo "/swapfile    none    swap    sw  0 0" >> /etc/fstab


# add packages
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
sudo apt upgrade -y
sudo apt install -y git
sudo apt install -y wget
sudo apt install -y openssl
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer
sudo apt install -y unzip
sudo apt autoremove -y

# install fish
sudo apt install -y fish
chsh -s /usr/bin/fish

# install dotfiles 
touch ~/dotfiles/fish/secrets.fish
fish &
echo 'source ~/dotfiles/fish/profile.fish' >> ~/.config/fish/config.fish
ln -s ~/dotfiles/fish/functions ~/.config/fish/functions

# install micro
curl https://getmic.ro | bash
sudo mv micro /usr/bin/micro

# download and install android sdk
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
sudo unzip sdk-tools-linux-4333796.zip
mkdir android-sdk-linux
sudo mv tools android-sdk-linux
rm sdk-tools-linux-4333796.zip
sudo chown -R stasbar1995:stasbar1995 android-sdk-linux/
cd android-sdk-linux
tools/bin/sdkmanager --update
tools/bin/sdkmanager --install
tools/bin/sdkmanager --licenses
cd ~

# add directories
mkdir ~/.keys
mkdir ~/projects 

# install keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -y -f
run_keybase
