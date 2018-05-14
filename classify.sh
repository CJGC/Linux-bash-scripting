#!/bin/bash

function classify {
  local -n data=$1
  for author in "${!data[@]}"
  do
    echo "Author name = "${author}
    echo
    echo ${data[${author}]} | sed "s/°/\\n/g"
  done
  echo
}

if [ $document = "book" ]
then
  classify books
else
  classify articles
fi
