#!/bin/bash

createPullRequest (){
    hub pull-request -F pull_request_message.txt -b "${BASE_BRANCH}" -r "${REVIEWERS}" -a "${ASSIGNEES}"
}