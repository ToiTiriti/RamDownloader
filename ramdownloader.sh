#!/bin/bash
set memory "a"
set conf "a"
echo "This may go wrong if you are not sure about this press Ctrl + C if you want to continue press enter."
read conf

echo "Enter the additonal ram amount in megabytes."
read memory
echo "You chose" $memory "megabytes is this correct? Press enter if so. Ctrl + c to cancel"
read conf
echo "this may take a short while"
sudo swapoff -a

sudo dd if=/dev/zero of=/swapfile bs=1M count=$memory

sudo chmod 0600 /swapfile

sudo mkswap /swapfile  # Set up a Linux swap area
sudo swapon /swapfile  # Turn the swap on

grep Swap /proc/meminfo
