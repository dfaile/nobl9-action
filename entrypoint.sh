#!/bin/sh

SLOCTL_VERSION=$1
CLIENT_ID=$2
CLIENT_SECRET=$3
ACCESS_TOKEN=$4
PROJECT=$5
SLOCTL_YML=$6

wget https://github.com/nobl9/sloctl/releases/download/"${SLOCTL_VERSION}"/sloctl-linux-"${SLOCTL_VERSION}".zip
unzip sloctl-linux-"${SLOCTL_VERSION}".zip
chmod +x ./sloctl
mkdir -p ~/.config/nobl9
touch ~/.config/nobl9/config.toml

echo 'defaultContext = "default"' >> ~/.config/nobl9/config.toml
echo '[Contexts]' >> ~/.config/nobl9/config.toml
echo '  [Contexts.default]' >> ~/.config/nobl9/config.toml
echo "    clientId = \"${CLIENT_ID}\"" >> ~/.config/nobl9/config.toml
echo "    clientSecret = \"${CLIENT_SECRET}\"" >> ~/.config/nobl9/config.toml
echo "    accessToken = \"${ACCESS_TOKEN}\"" >> ~/.config/nobl9/config.toml
echo "    project = \"${PROJECT}\"" >> ~/.config/nobl9/config.toml

./sloctl apply -f /github/workspace/"$SLOCTL_YML"
