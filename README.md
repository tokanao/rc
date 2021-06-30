
sudo useradd {username}
sudo passwd {username}
sudo visudo
sudo usermod -aG wheel {username}

sudo yum install zsh -y
sudo yum install screen -y

cp -r rc/.git ./
cp rc/.* ./


chsh -s /usr/bin/zsh {username}

