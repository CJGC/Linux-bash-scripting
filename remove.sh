#!/bin/bash

function remove {
  local -n data=$1
  for author in "${!data[@]}"
  do
    old_set=${data[${author}]}
    data[${author}]="$(echo ${data[${author}]} | sed "s/${document_name}°//")"
    if [ "${old_set}" != "${data[${author}]}" ]
    then
      echo ${document_name}" was deleted successfully!"
      break
    fi
  done
}

if [ $document = "book" ]
then
  remove books
else
  remove articles
fi
