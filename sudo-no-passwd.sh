#!/bin/bash

USER_NAME=$(whoami)
su -c "echo \"$USER_NAME ALL=(ALL) NOPASSWD:ALL\" > /etc/sudoers.d/$USER_NAME" root
