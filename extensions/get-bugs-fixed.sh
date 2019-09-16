#!/bin/bash

getBugsFixed(){
    bug_expression=':bug:'
    getListFromCommits ${bug_expression}
    bugs_fixed_result=("${result_list[@]}")
}