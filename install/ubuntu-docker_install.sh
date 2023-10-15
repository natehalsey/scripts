# remove existing installations
apt-get remove docker docker-engine docker.io containerd runc

# update ubuntu
apt-get update

# install necessary packages to install the gpg key
apt-get install \
    ca-certificates \
    curl \
    gnupg

# install the gpg key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# add repo
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# update ubuntu
apt-get update

# install docker engine
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
apt-get install docker-compose # this one doesn't get installed 

