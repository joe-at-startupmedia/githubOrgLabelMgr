cat config/repos.config | while read line
do
   `npm bin`/github-label $line  -j 'config/toDelete.json' -r
done
