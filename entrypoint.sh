#!/bin/sh

CLIENT_ID=$1
CLIENT_SECRET=$2
ACCESS_TOKEN=$3
PROJECT=$4
SLOCTL_YML=$5

mkdir -p ~/.config/nobl9
touch ~/.config/nobl9/config.toml

echo 'defaultContext = "default"' >> ~/.config/nobl9/config.toml
echo '[Contexts]' >> ~/.config/nobl9/config.toml
echo '  [Contexts.default]' >> ~/.config/nobl9/config.toml
echo "    clientId = \"${CLIENT_ID}\"" >> ~/.config/nobl9/config.toml
echo "    clientSecret = \"${CLIENT_SECRET}\"" >> ~/.config/nobl9/config.toml
echo "    accessToken = \"${ACCESS_TOKEN}\"" >> ~/.config/nobl9/config.toml
echo "    project = \"${PROJECT}\"" >> ~/.config/nobl9/config.toml

pwd
ls -alh
echo "/github/workspace"
ls -alh "/github/workspace"
echo "/github/workflow"
ls -alh "/github/workflow"
echo "/github/home"
ls -alh "/github/home"
sloctl apply -f /github/workspace/"$SLOCTL_YML"
