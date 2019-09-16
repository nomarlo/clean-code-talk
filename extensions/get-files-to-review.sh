#!/bin/bash

getFilesToReview(){
    files_to_review_result=()
    for file in "${modified_files[@]}"
    do
      files_to_review_result+=( "${UNORDERED_LIST_MARK}${file}" )
    done
}