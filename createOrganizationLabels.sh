GH_ORG=$1
GITHUB_TOKEN=$(cat `pwd`/config/.env.token)

if [ -z "$GH_ORG" ]
then
  echo "GH_ORG is required"
  exit 1
fi

cat config/repos.config | while read repo
do
  `npm bin`/github-label-sync -a  $GITHUB_TOKEN --labels config/labels.json $GH_ORG/$repo
done
