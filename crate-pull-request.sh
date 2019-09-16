#!/bin/bash

verifyIfHubIsInstalled(){
    if ! type hub version >/dev/null 2>&1; then
        echo "hub is not installed"  # 1>&2should output to stderr, not stdout
        echo "Installing hub.."  # 1>&2should output to stderr, not stdout
        brew install hub
        brew install gnu-sed
    fi
}

importExtensions(){
    for file in extensions/* ; do
        source "./${file}"
    done
}


source ./config.sh
source ./includes/git-handler.sh
source ./includes/template-handler.sh
source ./includes/pull-request-handler.sh

importExtensions

getCurrentBranch
getCommits
getModifiedFiles

getPullRequestTemplate
getTagsToReplace
replaceTags

echo "${pull_request_template}" >> pull_request_message.txt
createPullRequest


#echo "${files_modified[@]}"
#echo "${features_added[@]}"
#echo "${tagsToReplace}"
#echo "$list[@]"

#verifyIfHubIsInstalled