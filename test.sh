#!/bin/bash

declare -A array
author="Juan"
old_author=${author}


function name {
  local -n arr=$1
  local -n val=$2
  arr[${val}]="In a new state"
  val="Juan was changed!"
}

name array author
echo ${array[${old_author}]}
echo ${old_author}
echo ${author}
