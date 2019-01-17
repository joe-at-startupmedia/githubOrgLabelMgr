source `pwd`/accessToken.sh
cat config/repos.config | while read line
do
  `npm bin`/github-label $line -p priority
done
