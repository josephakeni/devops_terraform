#!/bin/bash

sudo cat << EOF >> /etc/sudoers
jenkins    ALL=NOPASSWD: ALL
EOF