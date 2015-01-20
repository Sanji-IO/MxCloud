#!/bin/bash

set -e

# Install all python deps
echo "Install all python deps..."
PACKAGES_DIR=$APP_DIR/build
PACKAGES=($(ls $APP_DIR/build))

if [ `source ~/.pyenv/bin/activate` ]; then
	echo "Creating isolated python env: ~/.pyenv ..."
	virtualenv ~/.pyenv
fi
source ~/.pyenv/bin/activate
echo "~/.pyenv is already created."

for ((index=0; index<${#PACKAGES[@]}; index++)); do
    pip install --no-index --no-deps --find-links=$PACKAGES_DIR $PACKAGES_DIR/${PACKAGES[$index]}
done
echo "Done."