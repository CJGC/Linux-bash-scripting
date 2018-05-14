#!/bin/bash

function add {
	local -n data=$1
	if [ ${data[${author_name}]+${author_name}} ]
	then
		if [[ $(echo "${data[${author_name}]}" | grep "\\b${document_name}\\b") ]]
		then
			echo ${document_name}" is already associated with "${author_name}
		else
			data[${author_name}]+=${document_name}"°"
		fi
	else
		data[${author_name}]=${document_name}"°"
	fi
}

if [ $document = "book" ]
then
	add books
else
	add articles
fi
