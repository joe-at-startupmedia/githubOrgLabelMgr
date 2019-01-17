source `pwd`/accessToken.sh
cat config/repos.config | while read line
do
  `npm bin`/github-label $line -j 'config/labels.json'
done
