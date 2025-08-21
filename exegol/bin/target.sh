#!/bin/env bash

IP=$(getent hosts "$TARGET" | awk '{ print $1 }')
echo "$DB_HOSTNAME" \("$IP"\)
