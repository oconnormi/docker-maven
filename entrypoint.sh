#!/bin/bash

echo "Checking for archive under /repo"
if [ -e "/repo/repo.tar.gz" ]; then
  echo "Archive exists, expanding..."
  tar xzf /repo/repo.tar.gz -C /workspace/
fi

echo "Executing maven with arguments: $@"
mvn "$@"
