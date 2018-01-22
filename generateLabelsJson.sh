`npm bin`/github-label $1 | grep -v priority | tr -d "#"  | gawk '
BEGIN { FS=" - "; printf "[\n"}
/Filesystem/ {next}
{ printf "  {\n    \"name\": \"%s\",\n    \"color\": \"%s\"\n  },\n",
  $2, $1
  separator = " "
}
END { print "]" }
' > config/labels.json
#removes the comma at the end of the last object
ex -sc ':%s/},\n]/}\r]/g|x' config/labels.json
