#!/usr/bin/env bash

about() {
      cat <<EOF
Github Orgranization Label Manager
  author: joe-at-startupmedia

  Available options:
    -d: enable debugging
    -a: generate the GitHub token configutation file.
    -r: reauthenticate using the token configutation file.
    -g: generate the labels.json and repo.config file.
    -s: Purge the keys by the configured patterns.
    -h: print this help page.

  Usage:
    $ golm -a [token]

    $ golm -g [gh_org] [gh_repo]

    $ golm -s [gh_org]

    $ golm -h
EOF

}

auth() {
  GITHUB_TOKEN=$1
  TOKEN_FILE=config/.env.token
  if [ -z "$GITHUB_TOKEN" ]; then
    if [[ ! -f "$TOKEN_FILE" ]]; then
      echo "FATAL: token required in $TOKEN_FILE"
      exit 1
    fi
  else
    GITHUB_TOKEN=$1
    echo "Wtiting token to $TOKEN_FILE"
    echo "$GITHUB_TOKEN" > $TOKEN_FILE
  fi
  gh auth login --with-token < $TOKEN_FILE
}

generate() {
  GH_ORG=$1
  GH_REP=$2

  echo "generating config/repos.config" && \
  gh repo list "$GH_ORG" --limit 200 --json name --jq '.[].name' > config/repos.config && \
  echo "generating config/labels.json" && \
  gh repo view "$GH_ORG"/"$GH_REP" --json labels --jq '.labels' > config/labels.json
}

sync() {
  GH_ORG=$1
  GITHUB_TOKEN=$(cat "$(pwd)/config/.env.token")

  while read -r repo
  do
    "$(npm bin)/github-label-sync" -a  "$GITHUB_TOKEN" --labels config/labels.json "$GH_ORG"/"$repo"
  done < config/repos.config
}

if [[ ${#} -eq 0 ]]; then
  about
fi

while getopts ":hdra:g:s:" opt; do
  case $opt in
    d)
      set -x
      ;;
    a)
      auth "$OPTARG"
      ;;
    r)
      auth
      ;;
    g)
      LASTARG="${*: -1}"
      generate "$OPTARG" "$LASTARG"
      ;;
    s)
      sync "$OPTARG"
      ;;
    h)
      about
      ;;
    ?)
      echo "Invalid option: -$OPTARG" >&2
      about
      ;;
  esac
done
