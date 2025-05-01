#!/bin/bash

# get tun0 ip
ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | xargs -I {} echo " {}"
