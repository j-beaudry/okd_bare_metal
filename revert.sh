#!/bin/bash
source .env

echo "Reverting changes"

rm -rf $FOLDER_CONFIG

cp -R $FOLDER_BACKUP $FOLDER_CONFIG
