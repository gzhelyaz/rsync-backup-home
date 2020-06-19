#!/bin/sh

CMDNAME=`basename $0`

while getopts n OPT
do
  case $OPT in
    "n" ) DRY_RUN="--dry-run" ;;
      * ) echo "Usage: $CMDNAME [-n]" 1>&2
          exit 1 ;;
  esac
done

SOURCE=${HOME}/
TARGET=/Volumes/Elements/Backups/home-backup-macmini/

[[ ! -d $TARGET ]] && echo "Target directory does NOT exist." && exit 1

rsync -av --stats --delete-excluded --modify-window=1 $DRY_RUN \
--include "/.ssh/" \
--include "/.dotfiles/" \
--exclude "/Pictures/" \
--exclude "/Movies/" \
--exclude "/Music/" \
--exclude ".DS_Store" \
--exclude ".localized" \
--exclude "/.CMVolumes/" \
--exclude "/Documents/Studio One/" \
--exclude "/Downloads/*" \
--exclude "/Library/Caches/" \
--exclude "/Library/Mobile Documents/" \
--exclude "/Library/" \
--exclude "/Splice/" \
--exclude "/.Trash/" \
--exclude "/VirtualBox VMs/" \
${SOURCE} ${TARGET}
