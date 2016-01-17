#!/bin/bash

# Repair "==> default: stdin: is not a tty" message
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

whoami
