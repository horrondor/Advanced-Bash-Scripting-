#!/bin/bash

# Backs up all files in current directory modified within last 24 hours
#+ in a "tarball" (tarred and gzipped file)

BACKUPFILE=backup-$(date +%m-%d-%y)
# Embeds date in backup filename.

archive=${1:-$BACKUPFILE}

tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
# tar cvf - (- means:)
#+ send tar output to stdout instead of file

gzip $archive.tar
echo "Directory $PWD backed up in archeve file \"$archive.tar.gz\"."

# Above code will fail if there are too many
#+ files found
#+ or if any filenames contain blank characters.

# find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"
# r option in tar appends files to existing tar file that is not compressed(tar.gz)