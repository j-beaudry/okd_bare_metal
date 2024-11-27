#!/bin/bash
source .env

echo "Reverting changes"

rm -rf config

cp -R backup config
