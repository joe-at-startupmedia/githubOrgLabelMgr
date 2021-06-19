GH_ORG=$1
GH_REP=$2

set -x

echo "generating config/repos.config" && \
gh repo list $GH_ORG --limit 200 --json name --jq '.[].name' > config/repos.config && \
echo "generating config/labels.json" && \
gh repo view $GH_ORG/$GH_REP --json labels --jq '.labels' > config/labels.json
