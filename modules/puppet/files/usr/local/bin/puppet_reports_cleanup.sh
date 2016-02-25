#!/bin/bash
# How many days worth of reports to keep?
days='+3'

for d in `find /var/lib/puppet/reports -mindepth 1 -maxdepth 1 -type d`
do
         find $d -type f -name '*.yaml' -mtime $days |
         sort -r |
         tail -n +2 |
         xargs -n50 /bin/rm -f
done

exit 0

