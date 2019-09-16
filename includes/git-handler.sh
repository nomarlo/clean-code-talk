#!/bin/bash

getCurrentBranch(){
    current_branch="$(git rev-parse --abbrev-ref HEAD)"
}

getCommits(){
    commits=()
    while IFS= read -r line; do
        commits+=( "$line" )
    done < <( git log origin/${current_branch} ^origin/${BASE_BRANCH} --oneline )
}


getModifiedFiles(){
    modified_files=()
    while IFS= read -r line; do
        modified_files+=( "$line" )
    done < <( git diff --name-only origin/${BASE_BRANCH}...origin/${current_branch} )
}

getListFromCommits(){
    result_list=()
    local expression_of_valid_commit=$1
    for element in "${commits[@]}"
    do
        if [[ ${element} == *"${expression_of_valid_commit}"* ]]; then
          result_list+=( "${UNORDERED_LIST_MARK}${element#*${expression_of_valid_commit}}" )
        fi
    done
}