#!/usr/bin/env bash
cd ~

bash -c "$(curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh)"

./postinstall.sh

