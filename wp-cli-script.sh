#!/bin/bash


#place to store backups
BACKUPPATH=/backups


#path to WP installs
SITESTORE=/home


#create array of sites based on folder name
SITELIST=($(ls -lh $SITESTORE | awk '{print $9}'))

#make sure the backup folder exists

mkdir -p $BACKUPPATH

#start the loop
for SITE in ${SITELIST[@]};
do
        if [ "$SITE" == "0_README_BEFORE_DELETING_VIRTFS" ] ; then
                continue;
        fi

        echo Updating in $SITE
        #enter the Wordpress folder
        cd $SITESTORE/$SITE/public_html
        #backup the WP folder
        #tar -czf $BACKUPPATH/$SITE.tar .
        #DBs all backed up to AWS s3 so no need to backup here
        wp plugin list --path=$SITESTORE/$SITE/public_html
        wp plugin update --all --path=$SITESTORE/$SITE/public_html;
done

