#!/bin/bash

function list {
  local -n data=$1
  echo $2
  echo
  for author in "${!data[@]}"
  do
    echo ${data[${author}]} | sed "s/°/\\n/g"
  done
  echo
}

if [ $document = "book" ]
then
  list books "======================== Available books ========================"
else
  list articles "===================== Available articles ====================="
fi
