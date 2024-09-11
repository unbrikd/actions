#!/bin/sh -l

ls -l /github/workspace

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT