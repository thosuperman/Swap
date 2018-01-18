#!/bin/sh

## Intro
echo "Setup Swap ..." 
echo

## Setup variables

# set swap size = RAM
SWAP_SIZE=$(free -m | awk '/Mem\:/ { print $2 }')

SWAP_PATH="/swapfile"

## Run
sudo dd if=/dev/zero of=$SWAP_PATH bs=1024 count=$SWAP_SIZE"k"
sudo chmod 600 $SWAP_PATH                # Make it non-world readable (bad!)
sudo chown root:root $SWAP_PATH
sudo mkswap $SWAP_PATH                   # Setup swap"         
sudo swapon $SWAP_PATH                   # Enable swap
sudo echo $SWAP_PATH none swap defaults 0 0 >> /etc/fstab

## Finish

echo
echo "Success! Now your system has $SWAP_SIZE MB swap at $SWAP_PATH"
