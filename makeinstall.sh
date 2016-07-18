#!/bin/bash

version=$(date +"%Y%m%d")

# Create the folder structure for the package
echo "Creating folders..."
mkdir -p ROOT/usr/local/outset/login-once
mkdir -p ROOT/usr/local/outset/login-every
mkdir -p ROOT/Library/Profiles

# Move the files where they need to be
echo "Moving files..."
mv *.mobileconfig ROOT/Library/Profiles/
mv check_dev.sh ROOT/usr/local/outset/login-every
mv 116_loginitems.sh 116_dock.sh 116_prefs.sh ROOT/usr/local/outset/login-once

# Set appropriate permissions
echo "Setting permissions..."
chown -R root:wheel ROOT
chmod -R 755 ROOT
sudo chmod -R a+x "ROOT/usr/local/outset/login-every"
sudo chmod -R a+x "ROOT/usr/local/outset/login-once"


# Build the package
echo "Building package..."
sudo pkgbuild --root ROOT --identifier us.nh.k12.portsmouth.116config --version $version 116Config.pkg
