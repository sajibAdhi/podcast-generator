#!/bin/bash

echo "=============================="

# Start the application
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

/app/venv/bin/python3 /app/feed.py

git add -A && git commit -m "Update feed"
git push --set-upstream origin main

echo "=============================="