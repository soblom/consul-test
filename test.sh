echo "Generating Secret"
if [[ -e config/consul_secret ]]; then
  echo "Consul Secret exists. Using existing one"
else
  consul keygen >> config/consul_secret
fi

key=$(cat config/consul_secret)
echo "KEY = $key"
