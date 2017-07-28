cat config/repos.config | while read line
do
  github-label $line  -j 'toDelete.json' -r
done
