cat config/repos.config | while read line
do
  github-label $line -j 'config/labels.json'
done
