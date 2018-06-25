#!/bin/bash

WEBDIR=/home/*/public_html/*

for dir in $WEBDIR;
do
        echo $(wp core check-update --path=/home/$dir/public_html --allow-root)

done



#find /home/ -type d \(  -name public_html \) -exec bash -c "cd '{}' &&  echo $(wp core check-update --allow-root)" \;

#www_dir=/home/

#for site_path in $( cd $www_dir ; find . -type d -name 'wp-admin' | sort -n ); do
        echo $(wp core check-update)
#done

