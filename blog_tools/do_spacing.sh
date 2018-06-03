#!/bin/bash

# To change spacing format as written in /Notes page.
# But after pulling by git, the order of pages in other workspaces may change.
# Only ensure the order not to change locally

for f in $(ls ../blog/source/*/*.md -t -r); do
    echo $f
    ./spacing.py $f
    sleep 1.5
done
