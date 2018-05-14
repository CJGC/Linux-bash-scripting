#!/bin/bash

function search {
  local -n data=$1
  for author in "${!data[@]}"
  do
    if [[ $(echo "${data[${author}]}" | grep "\\b${document_name}\\b") ]]
    then
      echo
      echo ${document_name}" document was found!"
      echo "The author is = "${author}
      echo
      break
    fi
  done
}

if [ $document = "book" ]
then
  search books
else
  search articles
fi
