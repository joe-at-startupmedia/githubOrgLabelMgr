source `pwd`/accessToken.sh
echo "generating repos.config: `npm bin`/gh re --list -O $1 | grep $1 > config/repos.config"
`npm bin`/gh re --list -O $1 | grep $1 > config/repos.config
echo "generating labels.config: `npm bin`/github-label $1/$2 > config/labels.config"
`npm bin`/github-label $1/$2 > config/labels.config
echo "genrating labels json files: ./generateLabelsJson.sh $1/$2 && cat config/*.config"  
./generateLabelsJson.sh $1/$2 && cat config/*.config
