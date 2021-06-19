GITHUB_TOKEN=$1
TOKEN_FILE=config/.env.token
if [ -z "$1" ]; then
  if [[ ! -f "$TOKEN_FILE" ]]; then
    echo "FATAL: token required in $TOKEN_FILE"
    exit 1
  fi
else
  GITHUB_TOKEN=$1
  echo "Wtiting token to $TOKEN_FILE"
  echo $GITHUB_TOKEN > $TOKEN_FILE
fi

gh auth login --with-token < $TOKEN_FILE
