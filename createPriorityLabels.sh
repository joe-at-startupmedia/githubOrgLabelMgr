cat config/repos.config | while read line
do
  github-label $line -p priority
done
