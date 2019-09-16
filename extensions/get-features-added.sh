#!/bin/bash

getFeaturesAdded(){
    feature_expression=':sparkles:'
    getListFromCommits ${feature_expression}
    features_added_result=("${result_list[@]}")
}