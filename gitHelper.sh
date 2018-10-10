#!/bin/bash

# Fetch process
fetchStep(){
echo "------------------------Starting fetch for $1------------------------"
git fetch


}

# Merge process
mergeStep(){
echo "------------------------Starting Merge the change------------------------"
git merge
}


