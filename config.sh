gh re --label --list -O $1 | grep $1 > config/repos.config
github-label $1/$2 > config/labels.config
./generateLabelsJson.sh $1/$2
