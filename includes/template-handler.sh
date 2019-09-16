#!/bin/bash

getPullRequestTemplate(){
    pull_request_template=$(<PULL_REQUEST_TEMPLATE.md)
}

getTagsToReplace(){
    tags_to_replace=($(  grep '{{.*}}' <<< "${pull_request_template}" | sort -u ))
}

getTagName(){
   tag_name=$(echo ${tag} | tr -d '{}')
}

callTagFunction(){
    local function_to_call=$(gsed -r 's/_(.)/\U\1/g' <<< "get_${tag_name}")
    ${function_to_call}
}

getTagFunctionResult(){
    result_variable="${tag_name}_result[@]"
    result_variable=("${!result_variable}")
}

replaceTags(){
    for tag in "${tags_to_replace[@]}"
    do
        getTagName
        callTagFunction
        getTagFunctionResult
        pull_request_template="${pull_request_template//${tag}/$(printf "%s\n" "${result_variable[@]}")}"
    done
}