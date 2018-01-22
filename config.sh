`npm bin`/gh re --list -O $1 | grep $1 > config/repos.config
`npm bin`/github-label $1/$2 > config/labels.config
./generateLabelsJson.sh $1/$2 && cat config/*.config
