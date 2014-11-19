
apt-get update
apt-get -y install unzip
apt-get -y install sed

echo "Installing Consul"
cd /usr/local/bin
wget https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip
unzip 0.4.1_linux_amd64.zip
rm 0.4.1_linux_amd64.zip

echo "Setting up Consul"
mkdir -p /etc/consul.d/bootstrap
mkdir -p /etc/consul.d/server
mkdir -p /etc/consul.d/client

cp /tmp/consul_conf/bootstrap.json /etc/consul.d/bootstrap/config.json
cp /tmp/consul_conf/bootstrap.json /etc/consul.d/server/config.json
cp /tmp/consul_conf/bootstrap.json /etc/consul.d/client/config.json

groupadd consul
useradd -d /home/consul -p consul123 -m consul -g consul
mkdir /var/consul
chown consul:consul /var/consul

echo "Generating Secret"
if [[ -e /tmp/consul_conf/consul_secret ]]; then
  echo "Using existing secret"
else
  echo "Secret stored for other VMs to use"
  consul keygen >> /consul_config/consul_secret
fi

key=$(cat /tmp/consul_conf/consul_secret)
put
sed "s/<<consul_secret>>/$key/" /etc/consul.d/bootstrap/config.json
