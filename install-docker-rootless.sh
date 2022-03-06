# verify active user for installation
id -u
whoami
# just check the user id and sub user and subgroup
grep ^$(whoami): /etc/subuid
grep ^$(whoami): /etc/subgid

# Install docker rootless without packages (with shell file)
curl -fsSL https://get.docker.com/rootless | sh


# Export parameters to be active for rootless actions

export PATH=/home/$USER/bin:$PATH
#export DOCKER_HOST=unix:///run/user/1000/docker.sock
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# install docker-compose : as simple as normal

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
