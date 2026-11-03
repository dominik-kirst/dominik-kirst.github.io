#!/bin/sh
# Generate a plain index.html listing every file in a folder.
# usage: sh gen-listing.sh <folder> <title>
set -eu

dir="$1"
title="$2"

{
  printf '<!DOCTYPE html>\n<html lang="en">\n<head>\n  <meta charset="utf-8">\n  <title>%s</title>\n</head>\n<body>\n  <h1>%s</h1>\n  <ul>\n' "$title" "$title"
  for f in "$dir"/*; do
    [ -f "$f" ] || continue
    n=$(basename "$f")
    [ "$n" = "index.html" ] && continue
    printf '    <li><a href="%s">%s</a></li>\n' "$n" "$n"
  done
  printf '  </ul>\n</body>\n</html>\n'
} > "$dir/index.html"
