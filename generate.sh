#!/bin/bash
set -e

for v in */; do
  v="${v%/}"
  if [ "$v" != "files" ]; then
    sed "s/%VERSION%/$v/g" Dockerfile.template > "$v/Dockerfile"
    rm -rf "$v/files"
    mkdir "$v/files"
    cp -av "./files/"* "$v/files/"
  fi
done
