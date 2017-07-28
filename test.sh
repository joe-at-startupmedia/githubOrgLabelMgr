github-label "Startup-Media/provider-api" | grep -v priority | tr -d "#"  | gawk '
BEGIN { FS=" - "; printf "[\n"}
/Filesystem/ {next}
{ printf "  {\n    \"name\": \"%s\",\n    \"color\": \"%s\"\n  },\n",
  $2, $1
  separator = " "
}
END { print "]" }
'
