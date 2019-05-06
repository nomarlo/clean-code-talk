#!/bin/bash

verifyIfHubIsInstalled(){
    if ! type hub version >/dev/null 2>&1; then
        echo "hub is not installed"  # 1>&2should output to stderr, not stdout
        echo "Installing hub.."  # 1>&2should output to stderr, not stdout
        brew install hub
    fi
}

getCurrentBranch(){
    current_branch="$(git rev-parse --abbrev-ref HEAD)"
}

getCommits(){
    commits=()
    while IFS= read -r line; do
        commits+=( "$line" )
    done < <( git log ${current_branch} ^origin/develop --oneline )
}


getCurrentBranch
getCommits

echo ${commits[@]}

#verifyIfHubIsInstalled